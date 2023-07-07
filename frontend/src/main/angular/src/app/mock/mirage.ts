import {createServer} from "miragejs";
import commesse from "./fixtures/commesse.fixture";
import events from "./fixtures/events.fixture";
import {commesseEndpoints} from "./routes/commesse.routes";
import {eventsEndpoints} from "./routes/events.routes";
import {allPassthrough} from "./routes/passthrought";

export const API_BASE_URL = 'http://localhost:10002/';

export function makeServer({ environment = 'development' }) {
  let server =  createServer({

    environment,

    // all mock files
    fixtures: {
      commesse,
      events
    },

    seeds(server) {
      server.loadFixtures();
    },

    routes() {
      commesseEndpoints(this);
      eventsEndpoints(this);

      /**
       * Define whitelist requests, and allow them to pass through our Mirage server.
       */
      allPassthrough(this);
    }

  });

  console.log(server.db.dump())
  return server;
}
