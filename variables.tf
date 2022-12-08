# REQUIRED
variable "USER_POOL_NAME" {
  description = "Name for the Cognito's User Pool"
  type        = string
}

variable "PROJECT_NAME" {
  description = "The project name that will be prefixed name tag"
  type        = string
}

# OPTIONAL
variable "USER_POOL_PASSWORD_POLICY" {
  description = "Key / Value Pairs for Cognito's User Pool Dynamic Password Policy"
  type = set(object({
    minimum_length                   = number
    require_lowercase                = bool
    require_uppercase                = bool
    require_numbers                  = bool
    require_symbols                  = bool
    temporary_password_validity_days = number
    }
    )
  )

  default = []
}

variable "RECOVERY_SETTINGS" {
  description = "Key / Value Pairs for Cognito's User Pool Dynamic Password Policy"
  type = set(object({
    name     = string
    priority = number
    }
    )
  )
  default = []
}

variable "ADMIN_CREATE_USER_CONFIG" {
  description = "A map for admin_create_user_config block"
  type = set(object({
    allow_admin_create_user_only = bool
    email_message                = string
    email_subject                = string
    sms_message                  = string
    }
    )
  )
  default = []
}

variable "ALIAS_ATTRIBUTES" {
  description = "Attributes supported as an alias for this user pool. Valid values: phone_number, email, or preferred_username. Conflicts with username_attributes"
  type        = set(string)
  default     = null
}

variable "AUTO_VERIFIED_ATTRIBUTES" {
  description = "Attributes to be auto-verified. Valid values: email, phone_number"
  type        = set(string)
  default     = []
}

variable "USER_POOL_DELETION_PROTECTION" {
  description = "When active, DeletionProtection prevents accidental deletion of your user pool. Before you can delete a user pool that you have protected against deletion, you must deactivate this feature. Valid values are ACTIVE and INACTIVE, Default value is INACTIVE"
  type        = string
  default     = null
}

variable "DEVICE_CONFIGURATION" {
  description = "Configuration block for the user pool's device tracking"
  type = set(object({
    challenge_required_on_new_device      = bool
    device_only_remembered_on_user_prompt = bool
    }
    )
  )
  default = []
}

variable "EMAIL_CONFIGURATION" {
  type = set(object({
    configuration_set      = string
    email_sending_account  = string
    from_email_address     = string
    reply_to_email_address = string
    source_arn             = string
    }
    )
  )
  default = []
}

variable "EMAIL_VERIFICATION_MESSAGE" {
  description = "String representing the email verification message. Conflicts with verification_message_template configuration block email_message argument"
  type        = string
  default     = null
}

variable "EMAIL_VERIFICATION_SUBJECT" {
  description = "String representing the email verification subject. Conflicts with verification_message_template configuration block email_subject argument"
  type        = string
  default     = null
}

variable "LAMBDA_CONFIG" {
  description = "Configuration block for the AWS Lambda triggers associated with the user pool"
  type = set(object({
    create_auth_challenge          = string
    custom_message                 = string
    define_auth_challenge          = string
    post_authentication            = string
    post_confirmation              = string
    pre_authentication             = string
    pre_sign_up                    = string
    pre_token_generation           = string
    user_migration                 = string
    verify_auth_challenge_response = string
    kms_key_id                     = string
    lambda_arn_email               = string
    lambda_version_email           = string
    lambda_arn_sms                 = string
    lambda_version_sms             = string
    }
    )
  )
  default = []
}

variable "MFA_CONFIGURATION" {
  description = "Multi-Factor Authentication (MFA) configuration for the User Pool. Defaults of OFF. Valid values are OFF (MFA Tokens are not required), ON (MFA is required for all users to sign in; requires at least one of sms_configuration or software_token_mfa_configuration to be configured), or OPTIONAL (MFA Will be required only for individual users who have MFA Enabled; requires at least one of sms_configuration or software_token_mfa_configuration to be configured)"
  type        = string
  default     = null
}

variable "POOL_SCHEMA" {
  description = "Configuration block for the schema attributes of a user pool. Detailed below. Schema attributes from the standard attribute set only need to be specified if they are different from the default configuration. Attributes can be added, but not modified or removed. Maximum of 50 attributes"
  type = set(object({
    attribute_data_type      = string
    developer_only_attribute = bool
    mutable                  = bool
    name                     = string
    required                 = bool
    max_value_number         = string
    min_value_number         = string
    max_value_string         = string
    min_value_string         = string
    }
    )
  )
  default = []
}

variable "SMS_AUTHENTICATION_MESSAGE" {
  description = "String representing the SMS authentication message. The Message must contain the {####} placeholder, which will be replaced with the code"
  type        = string
  default     = null
}

variable "SMS_CONFIGURATION" {
  description = "Configuration block for Short Message Service (SMS) settings. These settings apply to SMS user verification and SMS Multi-Factor Authentication (MFA). Due to Cognito API restrictions, the SMS configuration cannot be removed without recreating the Cognito User Pool. For user data safety, this resource will ignore the removal of this configuration by disabling drift detection"
  type = set(object({
    external_id    = string
    sns_caller_arn = string
    sns_region     = string
    }
    )
  )
  default = []
}

variable "SMS_VERIFICATION_MESSAGE" {
  description = "String representing the SMS verification message. Conflicts with verification_message_template configuration block sms_message argument"
  type        = string
  default     = null
}

variable "ENABLE_SOFTWARE_TOKEN_MFA" {
  description = "Boolean whether to enable software token Multi-Factor (MFA) tokens, such as Time-based One-Time Password (TOTP). To disable software token MFA When sms_configuration is not present, the mfa_configuration argument must be set to OFF and the software_token_mfa_configuration configuration block must be fully removed"
  type = set(object({
    enabled = bool
    }
    )
  )
  default = []
}

variable "ATTRIBUTES_REQUIRE_VERIFICATION_BEFORE_UPDATE" {
  description = "A list of attributes requiring verification before update. If set, the provided value(s) must also be set in auto_verified_attributes. Valid values: email, phone_number"
  type        = set(string)
  default     = []
}

variable "ADD_ONS_ADVANCED_SECURITY_MODE" {
  description = "Mode for advanced security, must be one of OFF, AUDIT or ENFORCED"
  type = set(object({
    advanced_security_mode = string
    }
    )
  )
  default = []
}

variable "USERNAME_ATTRIBUTES" {
  description = "Whether email addresses or phone numbers can be specified as usernames when a user signs up. Conflicts with alias_attributes"
  type        = set(string)
  default     = null
}

variable "USERNAME_CONFIGURATION_CASE_SENSITIVE" {
  description = "Whether username case sensitivity will be applied for all users in the user pool through Cognito APIs"
  type = set(object({
    case_sensitive = bool
    }
    )
  )
  default = []
}

variable "VERIFICATION_MESSAGE_TEMPLATE" {
  description = "Configuration block for verification message templates"
  type = set(object({
    default_email_option  = string
    email_message         = string
    email_message_by_link = string
    email_subject         = string
    email_subject_by_link = string
    sms_message           = string
    }
    )
  )
  default = [{
    default_email_option  = null
    email_message         = null
    email_message_by_link = "{##Click Here##}"
    email_subject         = "test"
    email_subject_by_link = "test"
    sms_message           = null
  }]
}

variable "TAGS" {
  type        = map(string)
  description = "Tag Map"
  default     = null
}
