## Getting Started
1. Run docker-compose from the repo root using the following command `docker-compose -f docker-compose.yml -f integrations/portal/custom-templates/docker-compose.yml up`.
2. Navigate to [http://localhost:3000/#/portal/pages/add](http://localhost:3000/#/portal/pages/add) in your browser to access the Tyk Dashboard and add a new Portal Page.
3. Fill in the `title` and `slug` fields and select `Custom Page Template` from the Page Type drop down menu.
4. Under the `Template name code` input `customTemplate` which is the provided or create your own and place it under `integrations/portal/custom-templates/src`.
5. Navigate to [http://localhost:3000/#/portal/$SLUG_VALUE](http://localhost:3000/#/portal/$SLUG_VALUE) to view your custom template.
