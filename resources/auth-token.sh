#!/bin/sh

source $HOME/.bashrc

curl -X POST localhost:$TYK_DB_LISTENPORT/api/apis \
  --header "Authorization: $TYK_TOKEN" \
  --header "Content-Type: application/json" \
  --data "{\"api_definition\":{\"api_id\":\"\",\"upstream_certificates\":{},\"use_keyless\":false,\"enable_coprocess_auth\":false,\"disable_quota\":false,\"custom_middleware_bundle\":\"\",\"cache_options\":{\"enable_cache\":true,\"enable_upstream_cache_control\":false,\"cache_timeout\":60,\"cache_response_codes\":[],\"cache_all_safe_requests\":false},\"enable_ip_blacklisting\":false,\"tag_headers\":[],\"jwt_scope_to_policy_mapping\":{},\"pinned_public_keys\":{},\"domain\":\"\",\"openid_options\":{\"segregate_by_client\":false,\"providers\":[]},\"active\":true,\"config_data\":{},\"notifications\":{\"oauth_on_keychange_url\":\"\",\"shared_secret\":\"\"},\"auth\":{\"use_certificate\":false},\"check_host_against_uptime_tests\":false,\"blacklisted_ips\":[],\"graphql\":{\"schema\":\"\",\"enabled\":false,\"engine\":{\"field_configs\":null,\"data_sources\":null},\"type_field_configurations\":[],\"execution_mode\":\"proxyOnly\",\"proxy\":{\"auth_headers\":{}},\"version\":\"2\",\"playground\":{\"enabled\":false,\"path\":\"\"}},\"hmac_allowed_clock_skew\":-1,\"uptime_tests\":{\"check_list\":[],\"config\":{\"service_discovery\":{\"use_discovery_service\":false,\"query_endpoint\":\"\",\"use_nested_query\":false,\"parent_data_path\":\"\",\"data_path\":\"\",\"cache_timeout\":60}}},\"enable_jwt\":false,\"name\":\"Auth Token\",\"slug\":\"auth-token\",\"oauth_meta\":{\"auth_login_redirect\":\"\",\"allowed_access_types\":[],\"allowed_authorize_types\":[]},\"CORS\":{\"enable\":false,\"allow_credentials\":false,\"options_passthrough\":false,\"max_age\":24,\"allowed_origins\":[\"*\"],\"allowed_methods\":[\"GET\",\"POST\",\"HEAD\"],\"allowed_headers\":[\"Origin\",\"Accept\",\"Content-Type\",\"X-Requested-With\",\"Authorization\"],\"exposed_headers\":[]},\"proxy\":{\"target_url\":\"http://httpbin.org\",\"service_discovery\":{\"endpoint_returns_list\":false,\"cache_timeout\":0,\"parent_data_path\":\"\",\"query_endpoint\":\"\",\"use_discovery_service\":false,\"_sd_show_port_path\":false,\"use_target_list\":false,\"use_nested_query\":false,\"data_path\":\"\",\"port_data_path\":\"\"},\"check_host_against_uptime_tests\":false,\"transport\":{\"ssl_insecure_skip_verify\":false,\"ssl_min_version\":0,\"proxy_url\":\"\",\"ssl_ciphers\":[]},\"target_list\":[],\"preserve_host_header\":false,\"strip_listen_path\":true,\"enable_load_balancing\":false,\"listen_path\":\"/auth-token/\",\"disable_strip_slash\":true},\"client_certificates\":[],\"use_basic_auth\":false,\"version_data\":{\"not_versioned\":true,\"versions\":{\"Default\":{\"name\":\"Default\",\"expires\":\"\",\"paths\":{\"ignored\":[],\"white_list\":[],\"black_list\":[]},\"use_extended_paths\":true,\"extended_paths\":{\"ignored\":[],\"white_list\":[],\"black_list\":[],\"transform\":[],\"transform_response\":[],\"transform_jq\":[],\"transform_jq_response\":[],\"transform_headers\":[],\"transform_response_headers\":[],\"hard_timeouts\":[],\"circuit_breakers\":[],\"url_rewrites\":[],\"virtual\":[],\"size_limits\":[],\"method_transforms\":[],\"track_endpoints\":[],\"do_not_track_endpoints\":[],\"validate_json\":[],\"internal\":[]},\"global_headers\":null,\"global_headers_remove\":null,\"global_response_headers\":null,\"global_response_headers_remove\":null,\"global_size_limit\":0,\"override_target\":\"\"}},\"default_version\":\"\"},\"jwt_scope_claim_name\":\"\",\"use_standard_auth\":true,\"hmac_allowed_algorithms\":[],\"disable_rate_limit\":false,\"definition\":{\"key\":\"x-api-version\",\"location\":\"header\"},\"use_oauth2\":false,\"use_go_plugin_auth\":false,\"allowed_ips\":[],\"org_id\":\"\",\"enable_ip_whitelisting\":false,\"global_rate_limit\":{\"rate\":0,\"per\":0},\"protocol\":\"\",\"enable_context_vars\":false,\"tags\":[],\"basic_auth\":{\"body_password_regexp\":\"\",\"body_user_regexp\":\"\",\"cache_ttl\":0,\"disable_caching\":false,\"extract_from_body\":false},\"listen_port\":0,\"auth_configs\":{\"authToken\":{\"auth_header_name\":\"Authorization\",\"use_param\":false,\"param_name\":\"\",\"use_cookie\":false,\"cookie_name\":\"\",\"use_certificate\":false},\"jwt\":{\"auth_header_name\":\"Authorization\",\"use_param\":false,\"param_name\":\"\",\"use_cookie\":false,\"cookie_name\":\"\"},\"hmac\":{\"auth_header_name\":\"Authorization\",\"use_param\":false,\"param_name\":\"\",\"use_cookie\":false,\"cookie_name\":\"\"},\"oauth\":{\"auth_header_name\":\"Authorization\",\"use_param\":false,\"param_name\":\"\",\"use_cookie\":false,\"cookie_name\":\"\"},\"oidc\":{\"auth_header_name\":\"Authorization\",\"use_param\":false,\"param_name\":\"\",\"use_cookie\":false,\"cookie_name\":\"\"},\"basic\":{\"auth_header_name\":\"Authorization\",\"use_param\":false,\"param_name\":\"\",\"use_cookie\":false,\"cookie_name\":\"\"},\"coprocess\":{\"auth_header_name\":\"Authorization\",\"use_param\":false,\"param_name\":\"\",\"use_cookie\":false,\"cookie_name\":\"\"}},\"strip_auth_data\":false,\"certificates\":[],\"enable_signature_checking\":false,\"use_openid\":false,\"internal\":false,\"enable_batch_request_support\":false,\"enable_detailed_recording\":false,\"response_processors\":[],\"use_mutual_tls_auth\":false},\"user_owners\":[],\"user_group_owners\":[],\"hook_references\":[]}"

APIID=`curl -X GET localhost:$TYK_DB_LISTENPORT/api/apis/search?q=Auth+Token \
  --header "Authorization: $TYK_TOKEN" | \
  jq -r '.apis[0].api_definition.api_id'`

curl -X POST localhost:$TYK_DB_LISTENPORT/api/portal/policies/ \
  --header "Authorization: $TYK_TOKEN" \
  --header "Content-Type: application/json" \
  --data "{\"rate\": 1000,\"per\": 60,\"quota_max\": -1,\"quota_renews\": 1481546970,\"quota_remaining\": 0,\"quota_renewal_rate\": 60,\"access_rights\": {\"$APIID\": {\"apiid\": \"$APIID\",\"api_name\": \"Auth Token\",\"versions\": [\"Default\"]}},\"name\": \"Auth Token Policy\",\"active\": true}"
