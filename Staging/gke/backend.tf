terraform{
  cloud {
    organization = "tfexample"

    workspaces {
      name = "tfexample"
    }
  }
}