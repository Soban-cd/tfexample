terraform{
  cloud {
    organization = "tfexample"

    workspaces {
      name = "tf-example"
    }
  }
}