library secretkeys;

const GITHUB_CLIENT_ID = "064d776864faba4db6c7";
const GITHUB_CLIENT_SECRET = "1dab8ca59f10d50154546ffbbf8da5ffadbb657b";

const AUTH_URL = "https://github.com/login/oauth/authorize" +
    "?client_id=" +
    GITHUB_CLIENT_ID +
    "&scope=public_repo%20read:user%20user:email";

const ACCESS_TOKEN_LINK = "https://github.com/login/oauth/access_token";
