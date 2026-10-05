# InvenTree Ops (demo company for the AI agent project)

Local InvenTree instance with demo data. The agent + MCP server will connect to its REST API.

- First time: double-click `setup.bat` (needs Docker Desktop running)
- Later: `start.bat` / `stop.bat`
- Web UI: http://localhost:8080
- API:    http://localhost:8080/api/
- Login:  admin / inventree (other demo users: allaccess/nolimits, reader/readonly, engineer/partsonly)

Data lives in `inventree-data/`. Reload demo data (wipes everything):
`docker compose run --rm inventree-server invoke dev.setup-test -i`
