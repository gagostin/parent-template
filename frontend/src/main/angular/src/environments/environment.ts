export const environment = {
  production: false,
  keycloakConfig: {
    clientId: 'parent-template-frontend',
    realm: 'parent-template',
    url: 'http://localhost:10006/auth'
  },
  restBaseUrl: 'http://localhost:10002/',
  cmsConfig: {
    baseUrl: 'http://localhost:10008/wp-json/wp/v2/',
    pages: 'pages'
  }
};
