terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "1.52.1"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.ibmcloud_region
}

data "ibm_resource_group" "rg" {
  name = var.resource_group
}

resource "ibm_code_engine_project" "code_engine_project_instance" {
  name              = var.ce_project_name
  resource_group_id = data.ibm_resource_group.rg.id
}

resource "ibm_code_engine_build" "code_engine_build_instance" {
  project_id    = ibm_code_engine_project.code_engine_project_instance.project_id
  name          = local.ce_build_name
  output_image  = local.output_image
  output_secret = var.icr_access_secret
  source_url    = var.source_code_url
  strategy_type = "dockerfile"
}

resource "ibm_code_engine_job" "code_engine_job_instance" {
  project_id      = ibm_code_engine_project.code_engine_project_instance.project_id
  name            = "bucket-restore-job"
  image_reference = local.output_image
  image_secret    = var.icr_access_secret


  run_env_variables {
    name  = "COS_ENDPOINT"
    type  = "literal"
    value = "s3.us-south.cloud-object-storage.appdomain.cloud"
  }
  run_env_variables {
    name  = "BUCKET_NAME"
    type  = "literal"
    value = "cos-vmcabredo-cos-standard-k2r"
  }
  run_env_variables {
    name  = "DATE"
    type  = "literal"
    value = "2023-01-01"
  }
  run_env_variables {
    name  = "DAYS"
    type  = "literal"
    value = "2"
  }
  run_env_variables {
    name  = "TIER"
    type  = "literal"
    value = "ACCELERATED"
  }
  run_env_variables {
    key       = "API_KEY"
    name      = "API_KEY"
    reference = "api-key"
    type      = "secret_key_reference"
  }
}