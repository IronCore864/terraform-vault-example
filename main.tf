provider "vault" {
  address = "http://127.0.0.1:8200"
}

resource "vault_generic_secret" "example" {
  path = "secret/foo"

  data_json = <<EOT
{
  "foo":   "bar",
  "pizza": "cheese"
}
EOT
}

data "vault_generic_secret" "example" {
  path = "secret/foo"
}

output "pwd" {
  value = "${data.vault_generic_secret.example.data["foo"]}"
}
