resource "aws_cognito_user_pool" "this" {
  name = var.USER_POOL_NAME

  dynamic "account_recovery_setting" {
    for_each = var.RECOVERY_SETTINGS
    content {
      recovery_mechanism {
        name     = account_recovery_setting.value["name"] == null ? null : account_recovery_setting.value["name"]
        priority = account_recovery_setting.value["priority"] == null ? null : account_recovery_setting.value["priority"]
      }
    }
  }

  dynamic "admin_create_user_config" {
    for_each = var.ADMIN_CREATE_USER_CONFIG
    content {
      allow_admin_create_user_only = admin_create_user_config.value["allow_admin_create_user_only"] == null ? null : admin_create_user_config.value["allow_admin_create_user_only"]
      invite_message_template {
        email_message = admin_create_user_config.value["email_message"] == null ? null : admin_create_user_config.value["email_message"]
        email_subject = admin_create_user_config.value["email_subject"] == null ? null : admin_create_user_config.value["email_subject"]
        sms_message   = admin_create_user_config.value["sms_message"] == null ? null : admin_create_user_config.value["sms_message"]
      }
    }
  }

  alias_attributes         = var.ALIAS_ATTRIBUTES
  auto_verified_attributes = var.AUTO_VERIFIED_ATTRIBUTES == [] ? [] : var.AUTO_VERIFIED_ATTRIBUTES
  deletion_protection      = var.USER_POOL_DELETION_PROTECTION

  dynamic "device_configuration" {
    for_each = var.DEVICE_CONFIGURATION
    content {
      challenge_required_on_new_device      = device_configuration.value["challenge_required_on_new_device"] == null ? null : device_configuration.value["challenge_required_on_new_device"]
      device_only_remembered_on_user_prompt = device_configuration.value["device_only_remembered_on_user_prompt"] == null ? null : device_configuration.value["device_only_remembered_on_user_prompt"]
    }
  }

  dynamic "email_configuration" {
    for_each = var.EMAIL_CONFIGURATION
    content {
      configuration_set      = email_configuration.value.configuration_set == null ? null : email_configuration.value.configuration_set
      email_sending_account  = email_configuration.value.email_sending_account == null ? null : email_configuration.value.email_sending_account
      from_email_address     = email_configuration.value.from_email_address == null ? null : email_configuration.value.from_email_address
      reply_to_email_address = email_configuration.value.reply_to_email_address == null ? null : email_configuration.value.reply_to_email_address
      source_arn             = email_configuration.value.source_arn == null ? null : email_configuration.value.source_arn
    }
  }

  email_verification_message = var.EMAIL_VERIFICATION_MESSAGE
  email_verification_subject = var.EMAIL_VERIFICATION_SUBJECT

  dynamic "lambda_config" {
    for_each = var.LAMBDA_CONFIG
    content {
      create_auth_challenge          = lambda_config.value["create_auth_challenge"] == null ? null : lambda_config.value["create_auth_challenge"]
      custom_message                 = lambda_config.value["custom_message"] == null ? null : lambda_config.value["custom_message"]
      define_auth_challenge          = lambda_config.value["define_auth_challenge"] == null ? null : lambda_config.value["define_auth_challenge"]
      post_authentication            = lambda_config.value["post_authentication"] == null ? null : lambda_config.value["post_authentication"]
      post_confirmation              = lambda_config.value["post_confirmation"] == null ? null : lambda_config.value["post_confirmation"]
      pre_authentication             = lambda_config.value["pre_authentication"] == null ? null : lambda_config.value["pre_authentication"]
      pre_sign_up                    = lambda_config.value["pre_sign_up"] == null ? null : lambda_config.value["pre_sign_up"]
      pre_token_generation           = lambda_config.value["pre_token_generation"] == null ? null : lambda_config.value["pre_token_generation"]
      user_migration                 = lambda_config.value["user_migration"] == null ? null : lambda_config.value["user_migration"]
      verify_auth_challenge_response = lambda_config.value["verify_auth_challenge_response"] == null ? null : lambda_config.value["verify_auth_challenge_response"]
      kms_key_id                     = lambda_config.value["kms_key_id"] == null ? null : lambda_config.value["kms_key_id"]
      custom_email_sender {
        lambda_arn     = lambda_config.value["lambda_arn_email"] == null ? null : lambda_config.value["lambda_arn_email"]
        lambda_version = lambda_config.value["lambda_version_email"] == null ? null : lambda_config.value["lambda_version_email"]
      }
      custom_sms_sender {
        lambda_arn     = lambda_config.value["lambda_arn_sms"] == null ? null : lambda_config.value["lambda_arn_sms"]
        lambda_version = lambda_config.value["lambda_version_sms"] == null ? null : lambda_config.value["lambda_version_sms"]
      }
    }
  }

  mfa_configuration = var.MFA_CONFIGURATION

  dynamic "password_policy" {
    for_each = var.USER_POOL_PASSWORD_POLICY
    content {
      minimum_length                   = password_policy.value["minimum_length"] == null ? null : password_policy.value["minimum_length"]
      require_lowercase                = password_policy.value["require_lowercase"] == null ? null : password_policy.value["require_lowercase"]
      require_numbers                  = password_policy.value["require_numbers"] == null ? null : password_policy.value["require_numbers"]
      require_symbols                  = password_policy.value["require_symbols"] == null ? null : password_policy.value["require_symbols"]
      require_uppercase                = password_policy.value["require_uppercase"] == null ? null : password_policy.value["require_uppercase"]
      temporary_password_validity_days = password_policy.value["temporary_password_validity_days"] == null ? null : password_policy.value["temporary_password_validity_days"]
    }
  }

  dynamic "schema" {
    for_each = var.POOL_SCHEMA
    content {
      attribute_data_type      = schema.value["attribute_data_type"] == null ? null : schema.value["attribute_data_type"]
      developer_only_attribute = schema.value["developer_only_attribute"] == null ? null : schema.value["developer_only_attribute"]
      mutable                  = schema.value["mutable"] == null ? null : schema.value["mutable"]
      name                     = schema.value["name"] == null ? null : schema.value["name"]
      number_attribute_constraints {
        max_value = schema.value["max_value_number"] == null ? null : schema.value["max_value_number"]
        min_value = schema.value["min_value_number"] == null ? null : schema.value["min_value_number"]
      }
      required = schema.value["required"] == null ? null : schema.value["required"]
      string_attribute_constraints {
        max_length = schema.value["max_length_string"] == null ? null : schema.value["max_length_string"]
        min_length = schema.value["min_length_string"] == null ? null : schema.value["min_length_string"]
      }
    }
  }
  sms_authentication_message = var.SMS_AUTHENTICATION_MESSAGE

  dynamic "sms_configuration" {
    for_each = var.SMS_CONFIGURATION
    content {
      external_id    = sms_configuration.value["external_id"] == null ? null : sms_configuration.value["external_id"]
      sns_caller_arn = sms_configuration.value["external_id"] == null ? null : sms_configuration.value["external_id"]
      sns_region     = sms_configuration.value["external_id"] == null ? null : sms_configuration.value["external_id"]
    }
  }

  sms_verification_message = var.SMS_VERIFICATION_MESSAGE

  dynamic "software_token_mfa_configuration" {
    for_each = length(var.ENABLE_SOFTWARE_TOKEN_MFA) > 0 ? var.ENABLE_SOFTWARE_TOKEN_MFA : []
    content {
      enabled = software_token_mfa_configuration.value["enabled"]
    }
  }
  # The variable ATTRIBUTES_REQUIRE_VERIFICATION_BEFORE_UPDATE must have the same values as AUTO_VERIFIED_ATTRIBUTES
  dynamic "user_attribute_update_settings" {
    for_each = var.ATTRIBUTES_REQUIRE_VERIFICATION_BEFORE_UPDATE != var.AUTO_VERIFIED_ATTRIBUTES ? [] : var.ATTRIBUTES_REQUIRE_VERIFICATION_BEFORE_UPDATE
    content {
      attributes_require_verification_before_update = var.ATTRIBUTES_REQUIRE_VERIFICATION_BEFORE_UPDATE == var.AUTO_VERIFIED_ATTRIBUTES ? var.ATTRIBUTES_REQUIRE_VERIFICATION_BEFORE_UPDATE : null
    }
  }

  dynamic "user_pool_add_ons" {
    for_each = var.ADD_ONS_ADVANCED_SECURITY_MODE != null ? var.ADD_ONS_ADVANCED_SECURITY_MODE : null
    content {
      advanced_security_mode = user_pool_add_ons.value["advanced_security_mode"]
    }
  }

  username_attributes = var.USERNAME_ATTRIBUTES
  dynamic "username_configuration" {
    for_each = length(var.USERNAME_CONFIGURATION_CASE_SENSITIVE) > 0 ? var.USERNAME_CONFIGURATION_CASE_SENSITIVE : []
    content {
      case_sensitive = username_configuration.value["case_sensitive"]
    }
  }

  dynamic "verification_message_template" {
    for_each = length(var.VERIFICATION_MESSAGE_TEMPLATE) > 0 ? var.VERIFICATION_MESSAGE_TEMPLATE : []
    content {
      default_email_option  = verification_message_template.value["default_email_option"] == null ? null : verification_message_template.value["default_email_option"]
      email_message         = verification_message_template.value["email_message"] == null ? null : verification_message_template.value["email_message"]
      email_message_by_link = verification_message_template.value["email_message_by_link"] == null ? null : verification_message_template.value["email_message_by_link"]
      email_subject         = verification_message_template.value["email_subject"] == null ? null : verification_message_template.value["email_subject"]
      email_subject_by_link = verification_message_template.value["email_subject_by_link"] == null ? null : verification_message_template.value["email_subject_by_link"]
      sms_message           = verification_message_template.value["sms_message"] == null ? null : verification_message_template.value["sms_message"]
    }
  }
  tags = var.TAGS != null ? "${merge(var.TAGS, { Name = "${var.PROJECT_NAME}-Cognito-User-Pool" })}" : { Name = "${var.PROJECT_NAME}-Cognito-User-Pool" }
}
