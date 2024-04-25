terraform {
    required_providers {
        github = {
            source = "integrations/github"
            version = "~> 5.0"
        }
    }
}
provider "github" {
	token=""//Colocar token de acceso	
}


/*resource "github_membership" "membership_for_user_x" {
    username = "cmramirezme"
  	role     = "member"
}*/

resource "github_repository" "example" {
	name = "example"
	description = "My awesome codebase"
	visibility = "public"
	auto_init= true
	allow_update_branch= true
	/*template {
		owner = "github"
		repository = "terraform-template-module"
		include_all_branches = true
	}*/
}

resource "github_repository" "example2" {
	name = "example2"
	description = "My awesome web page"
	visibility = "public"
	auto_init= true
	allow_update_branch= true
	pages {
		source {
			branch = "main"
			path = "/docs"
			}
		}
}

resource "github_branch" "development" {
	repository = "example"
	branch = "development"
}