module "expense" {
  count = length(var.expense)
  source = "./app-module"
  component = var.expense[count.index]
}

variable "expense" {
  default = ["frontend", "backend", "mysql"]
}