# Cognito User Pool Module by 7Clouds

Thank you for riding with us! Feel free to download or reference this respository in your terraform projects and studies

This module is a part of our product SCA — An automated API and Serverless Infrastructure generator that can reduce your API development time by 40-60% and automate your deployments up to 90%! Check it out at <https://seventechnologies.cloud>

Please rank this repo 5 starts if you like our job!

## Usage

The module deploys a cognito user pool. We have used dynamics and validations for the most part of it in due to use the max configuration possible or to ignore the unwanted configuration blocks.

Every dynamic block is composed by a set of objects. Each of them have been declared and are available on the variables, it also means an intelliSense may suggest the whole respective key/value pair.

## Example

```hcl
module "cognito_user_pool" {
  source = "./"
  USER_POOL_NAME = "user-pool-test-example"
  PROJECT_NAME   = "ExampleProject"
  ALIAS_ATTRIBUTES = [ "email" ]
  ADMIN_CREATE_USER_CONFIG = [ {
    allow_admin_create_user_only = true
    email_message = "Your username is {username} and temporary password is {####}."
    email_subject = "Your verification code"
    sms_message = "Your username is {username} and temporary password is {####}."
  } ]
  AUTO_VERIFIED_ATTRIBUTES = [ "email" ]
  RECOVERY_SETTINGS = [ {
    name = "verified_email"
    priority = 1
  } ]
  USER_POOL_DELETION_PROTECTION = "INACTIVE"
  USER_POOL_PASSWORD_POLICY = [ {
    minimum_length = 8
    require_lowercase = false
    require_numbers = true
    require_symbols = true
    require_uppercase = true
    temporary_password_validity_days = 1
  } ]
  TAGS = {
    AWS_REGION      = "us-east-1"
    PROJECT_NAME    = module.cognito_user_pool.PROJECT_NAME
    ENVIRONMENT     = "DEV"
    COMPANY         = "CompanyName"
    OWNER           = "ProjectOwner"
    PROJECT_TYPE    = "Serverless"
    PROJECT_VERSION = "v0.1.0"
    LOB             = "Large Accounts"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cognito_user_pool.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ADD_ONS_ADVANCED_SECURITY_MODE"></a> [ADD\_ONS\_ADVANCED\_SECURITY\_MODE](#input\_ADD\_ONS\_ADVANCED\_SECURITY\_MODE) | Mode for advanced security, must be one of OFF, AUDIT or ENFORCED | <pre>set(object({<br>    advanced_security_mode = string<br>    }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_ADMIN_CREATE_USER_CONFIG"></a> [ADMIN\_CREATE\_USER\_CONFIG](#input\_ADMIN\_CREATE\_USER\_CONFIG) | A map for admin\_create\_user\_config block | <pre>set(object({<br>    allow_admin_create_user_only = bool<br>    email_message                = string<br>    email_subject                = string<br>    sms_message                  = string<br>    }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_ALIAS_ATTRIBUTES"></a> [ALIAS\_ATTRIBUTES](#input\_ALIAS\_ATTRIBUTES) | Attributes supported as an alias for this user pool. Valid values: phone\_number, email, or preferred\_username. Conflicts with username\_attributes | `set(string)` | `null` | no |
| <a name="input_ATTRIBUTES_REQUIRE_VERIFICATION_BEFORE_UPDATE"></a> [ATTRIBUTES\_REQUIRE\_VERIFICATION\_BEFORE\_UPDATE](#input\_ATTRIBUTES\_REQUIRE\_VERIFICATION\_BEFORE\_UPDATE) | A list of attributes requiring verification before update. If set, the provided value(s) must also be set in auto\_verified\_attributes. Valid values: email, phone\_number | `set(string)` | `[]` | no |
| <a name="input_AUTO_VERIFIED_ATTRIBUTES"></a> [AUTO\_VERIFIED\_ATTRIBUTES](#input\_AUTO\_VERIFIED\_ATTRIBUTES) | Attributes to be auto-verified. Valid values: email, phone\_number | `set(string)` | `[]` | no |
| <a name="input_DEVICE_CONFIGURATION"></a> [DEVICE\_CONFIGURATION](#input\_DEVICE\_CONFIGURATION) | Configuration block for the user pool's device tracking | <pre>set(object({<br>    challenge_required_on_new_device      = bool<br>    device_only_remembered_on_user_prompt = bool<br>    }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_EMAIL_CONFIGURATION"></a> [EMAIL\_CONFIGURATION](#input\_EMAIL\_CONFIGURATION) | n/a | <pre>set(object({<br>    configuration_set      = string<br>    email_sending_account  = string<br>    from_email_address     = string<br>    reply_to_email_address = string<br>    source_arn             = string<br>    }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_EMAIL_VERIFICATION_MESSAGE"></a> [EMAIL\_VERIFICATION\_MESSAGE](#input\_EMAIL\_VERIFICATION\_MESSAGE) | String representing the email verification message. Conflicts with verification\_message\_template configuration block email\_message argument | `string` | `null` | no |
| <a name="input_EMAIL_VERIFICATION_SUBJECT"></a> [EMAIL\_VERIFICATION\_SUBJECT](#input\_EMAIL\_VERIFICATION\_SUBJECT) | String representing the email verification subject. Conflicts with verification\_message\_template configuration block email\_subject argument | `string` | `null` | no |
| <a name="input_ENABLE_SOFTWARE_TOKEN_MFA"></a> [ENABLE\_SOFTWARE\_TOKEN\_MFA](#input\_ENABLE\_SOFTWARE\_TOKEN\_MFA) | Boolean whether to enable software token Multi-Factor (MFA) tokens, such as Time-based One-Time Password (TOTP). To disable software token MFA When sms\_configuration is not present, the mfa\_configuration argument must be set to OFF and the software\_token\_mfa\_configuration configuration block must be fully removed | <pre>set(object({<br>    enabled = bool<br>    }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_LAMBDA_CONFIG"></a> [LAMBDA\_CONFIG](#input\_LAMBDA\_CONFIG) | Configuration block for the AWS Lambda triggers associated with the user pool | <pre>set(object({<br>    create_auth_challenge          = string<br>    custom_message                 = string<br>    define_auth_challenge          = string<br>    post_authentication            = string<br>    post_confirmation              = string<br>    pre_authentication             = string<br>    pre_sign_up                    = string<br>    pre_token_generation           = string<br>    user_migration                 = string<br>    verify_auth_challenge_response = string<br>    kms_key_id                     = string<br>    lambda_arn_email               = string<br>    lambda_version_email           = string<br>    lambda_arn_sms                 = string<br>    lambda_version_sms             = string<br>    }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_MFA_CONFIGURATION"></a> [MFA\_CONFIGURATION](#input\_MFA\_CONFIGURATION) | Multi-Factor Authentication (MFA) configuration for the User Pool. Defaults of OFF. Valid values are OFF (MFA Tokens are not required), ON (MFA is required for all users to sign in; requires at least one of sms\_configuration or software\_token\_mfa\_configuration to be configured), or OPTIONAL (MFA Will be required only for individual users who have MFA Enabled; requires at least one of sms\_configuration or software\_token\_mfa\_configuration to be configured) | `string` | `null` | no |
| <a name="input_POOL_SCHEMA"></a> [POOL\_SCHEMA](#input\_POOL\_SCHEMA) | Configuration block for the schema attributes of a user pool. Detailed below. Schema attributes from the standard attribute set only need to be specified if they are different from the default configuration. Attributes can be added, but not modified or removed. Maximum of 50 attributes | <pre>set(object({<br>    attribute_data_type      = string<br>    developer_only_attribute = bool<br>    mutable                  = bool<br>    name                     = string<br>    required                 = bool<br>    max_value_number         = string<br>    min_value_number         = string<br>    max_value_string         = string<br>    min_value_string         = string<br>    }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_PROJECT_NAME"></a> [PROJECT\_NAME](#input\_PROJECT\_NAME) | The project name that will be prefixed name tag | `string` | n/a | yes |
| <a name="input_RECOVERY_SETTINGS"></a> [RECOVERY\_SETTINGS](#input\_RECOVERY\_SETTINGS) | Key / Value Pairs for Cognito's User Pool Dynamic Password Policy | <pre>set(object({<br>    name     = string<br>    priority = number<br>    }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_SMS_AUTHENTICATION_MESSAGE"></a> [SMS\_AUTHENTICATION\_MESSAGE](#input\_SMS\_AUTHENTICATION\_MESSAGE) | String representing the SMS authentication message. The Message must contain the {####} placeholder, which will be replaced with the code | `string` | `null` | no |
| <a name="input_SMS_CONFIGURATION"></a> [SMS\_CONFIGURATION](#input\_SMS\_CONFIGURATION) | Configuration block for Short Message Service (SMS) settings. These settings apply to SMS user verification and SMS Multi-Factor Authentication (MFA). Due to Cognito API restrictions, the SMS configuration cannot be removed without recreating the Cognito User Pool. For user data safety, this resource will ignore the removal of this configuration by disabling drift detection | <pre>set(object({<br>    external_id    = string<br>    sns_caller_arn = string<br>    sns_region     = string<br>    }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_SMS_VERIFICATION_MESSAGE"></a> [SMS\_VERIFICATION\_MESSAGE](#input\_SMS\_VERIFICATION\_MESSAGE) | String representing the SMS verification message. Conflicts with verification\_message\_template configuration block sms\_message argument | `string` | `null` | no |
| <a name="input_TAGS"></a> [TAGS](#input\_TAGS) | Tag Map | `map(string)` | `null` | no |
| <a name="input_USERNAME_ATTRIBUTES"></a> [USERNAME\_ATTRIBUTES](#input\_USERNAME\_ATTRIBUTES) | Whether email addresses or phone numbers can be specified as usernames when a user signs up. Conflicts with alias\_attributes | `set(string)` | `null` | no |
| <a name="input_USERNAME_CONFIGURATION_CASE_SENSITIVE"></a> [USERNAME\_CONFIGURATION\_CASE\_SENSITIVE](#input\_USERNAME\_CONFIGURATION\_CASE\_SENSITIVE) | Whether username case sensitivity will be applied for all users in the user pool through Cognito APIs | <pre>set(object({<br>    case_sensitive = bool<br>    }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_USER_POOL_DELETION_PROTECTION"></a> [USER\_POOL\_DELETION\_PROTECTION](#input\_USER\_POOL\_DELETION\_PROTECTION) | When active, DeletionProtection prevents accidental deletion of your user pool. Before you can delete a user pool that you have protected against deletion, you must deactivate this feature. Valid values are ACTIVE and INACTIVE, Default value is INACTIVE | `string` | `null` | no |
| <a name="input_USER_POOL_NAME"></a> [USER\_POOL\_NAME](#input\_USER\_POOL\_NAME) | Name for the Cognito's User Pool | `string` | n/a | yes |
| <a name="input_USER_POOL_PASSWORD_POLICY"></a> [USER\_POOL\_PASSWORD\_POLICY](#input\_USER\_POOL\_PASSWORD\_POLICY) | Key / Value Pairs for Cognito's User Pool Dynamic Password Policy | <pre>set(object({<br>    minimum_length                   = number<br>    require_lowercase                = bool<br>    require_uppercase                = bool<br>    require_numbers                  = bool<br>    require_symbols                  = bool<br>    temporary_password_validity_days = number<br>    }<br>    )<br>  )</pre> | `[]` | no |
| <a name="input_VERIFICATION_MESSAGE_TEMPLATE"></a> [VERIFICATION\_MESSAGE\_TEMPLATE](#input\_VERIFICATION\_MESSAGE\_TEMPLATE) | Configuration block for verification message templates | <pre>set(object({<br>    default_email_option  = string<br>    email_message         = string<br>    email_message_by_link = string<br>    email_subject         = string<br>    email_subject_by_link = string<br>    sms_message           = string<br>    }<br>    )<br>  )</pre> | <pre>[<br>  {<br>    "default_email_option": null,<br>    "email_message": null,<br>    "email_message_by_link": "{##Click Here##}",<br>    "email_subject": "test",<br>    "email_subject_by_link": "test",<br>    "sms_message": null<br>  }<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_PROJECT_NAME"></a> [PROJECT\_NAME](#output\_PROJECT\_NAME) | n/a |
| <a name="output_TAGS"></a> [TAGS](#output\_TAGS) | n/a |
| <a name="output_USER_POOL_ARN"></a> [USER\_POOL\_ARN](#output\_USER\_POOL\_ARN) | n/a |
| <a name="output_USER_POOL_ENDPOINT"></a> [USER\_POOL\_ENDPOINT](#output\_USER\_POOL\_ENDPOINT) | n/a |
| <a name="output_USER_POOL_ID"></a> [USER\_POOL\_ID](#output\_USER\_POOL\_ID) | n/a |
| <a name="output_USER_POOL_NAME"></a> [USER\_POOL\_NAME](#output\_USER\_POOL\_NAME) | n/a |
<!-- END_TF_DOCS -->