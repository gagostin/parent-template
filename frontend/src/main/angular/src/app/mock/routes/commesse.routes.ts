import {Registry, Server} from "miragejs";
import {AnyFactories, AnyModels} from "miragejs/-types";
import {API_BASE_URL} from "../mirage";

export function commesseEndpoints(server: Server<Registry<AnyModels, AnyFactories>> ) {

  server.get(API_BASE_URL + "commesse", (schema) => {
    return schema.db.commesse;
  })

  server.get(API_BASE_URL + "commesse/:key", (schema, request) => {
    return schema.db.commesse.findBy({key: request.params.key});
  })

}
