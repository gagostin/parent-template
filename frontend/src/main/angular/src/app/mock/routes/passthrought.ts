import { Registry, Server } from "miragejs";
import { AnyFactories, AnyModels } from "miragejs/-types";

/**
 * All requests on the current and external domain to pass through.
 *
 * @param server
 */
export function allPassthrough(server: Server<Registry<AnyModels, AnyFactories>> ) {

  server.namespace = '/';
  /**
   * all requests on the current domain to pass through.
   * Note that the current namespace (i.e. any namespace property defined above this call) will be applied.
   */
  server.passthrough();

  /**
   * external request
   */
  // server.passthrough(
  //   'https://ols-cms.k8s-prod.grouperci.com/**',
  //   'https://cdn.cookielaw.org/**',
  //   'https://geolocation.onetrust.com/**',
  //   'https://privacyportal-fr.onetrust.com/**',
  // );

  /**
   * complex requests
   * do a runtime check on whether or not the request should be handled by Mirage.
   * If the function returns true Mirage will not handle the request and let it pass through.
   *
   * Put attantion all requests pass through here method
   */
  server.passthrough(request => {
    const url =  request.url;
    const headers = request.requestHeaders;
    // after each log you must see a Mirage Response or a Mirage Passthrough
    // otherwise the request must be handled
    console.log('send request: ' + url);
    return url.includes('clarity.ms');
  });

}
