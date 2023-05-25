terramate {
  #required_version = "~> 0.1.35"
  required_version = "~> 0.2.18"

  config {
    git {
      default_branch   = "master"
      default_remote   = "origin"
      check_untracked  = false
      check_uncommitted = false
    }
    run {
      env {
        TF_PLUGIN_CACHE_DIR = "${terramate.root.path.fs.absolute}/.terraform-cache-dir"
      }
    }
  }
}

