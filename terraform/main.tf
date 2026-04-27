# ---------------- AWS Key Pair ----------------
resource "aws_key_pair" "jenkins_key" {
  provider   = aws.virginia
  key_name   = "jenkins-key-auto"
  public_key = file("jenkins-key-auto.pub")
}

# ---------------- VPC ----------------
resource "aws_vpc" "vpc_virginia" {
  provider             = aws.virginia
  cidr_block           = "10.1.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "virginia-vpc"
  }
}

# ---------------- Subnet ----------------
resource "aws_subnet" "subnet_virginia" {
  provider                = aws.virginia
  vpc_id                  = aws_vpc.vpc_virginia.id
  cidr_block              = "10.1.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "virginia-subnet"
  }
}

# ---------------- Internet Gateway ----------------
resource "aws_internet_gateway" "igw" {
  provider = aws.virginia
  vpc_id   = aws_vpc.vpc_virginia.id

  tags = {
    Name = "trend-igw"
  }
}

# ---------------- Route Table ----------------
resource "aws_route_table" "rt" {
  provider = aws.virginia
  vpc_id   = aws_vpc.vpc_virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# ---------------- Route Table Association ----------------
resource "aws_route_table_association" "rta" {
  provider       = aws.virginia
  subnet_id      = aws_subnet.subnet_virginia.id
  route_table_id = aws_route_table.rt.id
}


# ---------------- Security Group ----------------
resource "aws_security_group" "jenkins_sg" {
  provider    = aws.virginia
  name        = "virginia-sg"
  description = "Allow SSH and Jenkins ports"
  vpc_id      = aws_vpc.vpc_virginia.id


  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "virginia-sg"
  }
}

# ---------------- IAM Role ----------------
resource "aws_iam_role" "ec2_role" {
  name = "jenkins-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

# Attach Admin policy (for demo purpose)
resource "aws_iam_role_policy_attachment" "ssm_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "eks_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "ecr_attach" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
}

# Instance profile
resource "aws_iam_instance_profile" "profile" {
  name = "jenkins-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_instance" "jenkins" {
  provider                    = aws.virginia
  ami                         = "ami-0ec10929233384c7f"
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.jenkins_key.key_name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.subnet_virginia.id
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]
  iam_instance_profile        = aws_iam_instance_profile.profile.name

  user_data = <<-EOF
              #!/bin/bash
              set -eux
              
              # Update system
              apt update -y
              apt upgrade -y

              # Java 21 (stable for Jenkins)
              sudo apt install fontconfig openjdk-21-jre -y

              # Install Jenkins
              sudo mkdir -p /usr/share/keyrings
              sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

              echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
              https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
              /etc/apt/sources.list.d/jenkins.list > /dev/null

              apt update -y
              apt install -y jenkins

              sudo systemctl enable jenkins
              sudo systemctl start jenkins

              # Install Docker
              sudo apt install -y docker.io
              sudo systemctl enable docker
              sudo systemctl start docker

              sudo usermod -aG docker ubuntu
              sudo usermod -aG docker jenkins

              # Install Docker Compose
              sudo apt-get update -y
              sudo apt install -y docker-compose-v2

              # Install kubectl
              curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
              chmod +x kubectl
              mv kubectl /usr/local/bin/

              # WAIT for Jenkins to stabilize
              sleep 90

              echo "Jenkins setup completed" > /var/log/jenkins-ready.log

              EOF

  # root storage (EBS)
  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "Jenkins-Server"
  }
}

