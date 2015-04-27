library(httr)

# 1. Find OAuth settings for Jawbone:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")
oauth_endpoint(base_url = "https://jawbone.com/auth/oauth2/auth", 
               authorize = "authorization", access = "accessToken", 
)


# 2. Register an application at https://github.com/settings/applications;
#    Use any URL you would like for the homepage URL (http://github.com is fine)
#    and http://localhost:1410 as the callback url
#
#    Insert your client ID and secret below - if secret is omitted, it will
#    look it up in the GITHUB_CONSUMER_SECRET environmental variable.
myapp <- oauth_app("github", "56b637a5baffac62cad9")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)