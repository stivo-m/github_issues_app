library secretkeys;



const AUTH_URL = "https://github.com/login/oauth/authorize" +
    "?client_id=" +
    GITHUB_CLIENT_ID +
    "&scope=public_repo%20read:user%20user:email";

const ACCESS_TOKEN_LINK = "https://github.com/login/oauth/access_token";

