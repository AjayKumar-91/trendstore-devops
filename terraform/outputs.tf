output "jenkins_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.jenkins.public_ip
}

output "jenkins_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.jenkins.public_dns
}

# ---------------- Output ----------------
output "jenkins_url" {
  value = "http://${aws_instance.jenkins.public_ip}:8080"
}