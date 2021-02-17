library secretkeys;

const GITHUB_CLIENT_ID = "064d776864faba4db6c7";
const GITHUB_CLIENT_SECRET = "24232a2113b3f631d57f14c8b10d710d40236f07";
const FIREBASE_API_KEY = "AIzaSyCOM90rb33IgYDuaYTpWSQOrClUbJ-eXNY";
const FIREBASE_APP_ID = "1056574195533";
const FIREBASE_MESSAGING_SENDER_ID = "1056574195533";
const FIREBASE_PROJECT_ID = "github-issue-tracker-b7435";
const AUTH_DOMAIN =
    "https://github-issue-tracker-b7435.firebaseapp.com/__/auth/handler";

const AUTH_URL = "https://github.com/login/oauth/authorize" +
    "?client_id=" +
    GITHUB_CLIENT_ID +
    "&scope=public_repo%20read:user%20user:email";

const ACCESS_TOKEN_LINK = "https://github.com/login/oauth/access_token";
