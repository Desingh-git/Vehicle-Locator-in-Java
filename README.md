About

Vehicle Locator is a Java application designed to help drivers quickly find the nearest available mechanic when a vehicle breaks down. It integrates Google Maps for location discovery and routing, and provides contact and service information so users can get assistance fast.

Key capabilities
- Nearest-mechanic search: finds and ranks nearby mechanics by distance and estimated travel time.
- Google Maps integration: displays mechanic locations as map markers, shows routes, and provides turn-by-turn directions.
- Contact & service details: store and surface phone numbers, workshop hours, services offered, and customer ratings.
- Filters: narrow results by service type (towing, electrical, tire, engine) and availability.
- One-tap actions: call a mechanic or open navigation in Google Maps from the UI.
- Offline resilience: caches recent mechanic locations to offer basic lookup when connectivity is poor (optional depending on configuration).

How it works
1. The app queries the local datastore and/or Google Places API to locate nearby mechanic entries.
2. Results are shown on an embedded Google Map with distance and ETA calculated via Google Directions API.
3. Users can view details, call a mechanic, or launch navigation to the chosen workshop.

Architecture & components
- Client/UI: Java-based desktop or web front-end (Swing/JavaFX or web UI) that embeds Google Maps and handles user interactions.
- Backend/API: Java server (Spring Boot or similar) providing endpoints for search, mechanic CRUD, and route lookups.
- Persistence: Relational DB (Postgres/MySQL) or embedded store for mechanic records and caching.
- External APIs: Google Maps Platform (Maps JavaScript/Android/iOS SDKs, Places API, Directions API) for geolocation, places, and routing.

Requirements & configuration
- Java 11+ (or project-targeted JDK)
- Google Maps API key with Places and Directions enabled
- Database server if persistence is required
- Configure API keys and DB connection in config.properties or environment variables

Privacy & safety
- Store only minimal contact/location data required for service.
- Avoid logging sensitive user location history unless explicitly opt-in.
- Secure API keys and use server-side proxying for requests where appropriate.
