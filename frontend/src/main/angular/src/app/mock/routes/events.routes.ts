import {Registry, Server} from "miragejs";
import {AnyFactories, AnyModels} from "miragejs/-types";
import {API_BASE_URL} from "../mirage";

export function eventsEndpoints(server: Server<Registry<AnyModels, AnyFactories>> ) {

  server.get(API_BASE_URL + "events", (schema) => {
    return schema.db.events;
  })

  server.get(API_BASE_URL + "events/:id", (schema, request) => {
    return schema.db.events.findBy({eventId: request.params.id});
  })

  server.post(API_BASE_URL + "events", (schema, request) => {
    let body = JSON.parse(request.requestBody);
    return schema.db.events.insert(body);
  })

  // server.delete(API_BASE_URL + "events/:id", (schema, request) => {
  //   return schema.db.events.remove(request.params.id);
  // })

}
