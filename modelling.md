# Modelling


## Preparation

1. Go to XXX, login with your user account.
2. Create a project `dest-USERNAME` by replacing `USERNAME` by your user name.
3. Open the project
4. Go to the `Settings` page
5. Provide the credentials for connecting to the database
     - Database: `PostgreSQL`
     - Host: `XXXXX`
     - Database name: `postgres`
     - Username: `tuto`
     - Password: `YYYYYY`
6. Save the credentials and go to the `Lenses` page. You see there, on the left, the list of database tables and views.


## Ontology
 1. Go to the `Ontology` page
 2. Import the file `schema.owl` in the `ontologies` directory
 3. Import the file `geosparql.owl` in the `ontologies` directory


## Lodging businesses (source 1)

### Lens

 1. Go to the `Lenses` page
 2. Among the `Source Tables` (on the left), select the schema `source1` to filter the tables
 3. Select the table `source1.hospitality` and click on `Generate mirror lens`
 4. Click on `lenses.source1.hospitality` on the right to open the newly created lens.
 5. Click on `Constraints` and observe that a unique constraint is defined on the `h_id` column, as well as foreign key on the `m_id` column.
 6. The column `geometrypoint` is in a binary format and needs to be converted into the [Well-Known Text format](https://en.wikipedia.org/wiki/Well-known_text_representation_of_geometry). Click on the menu of the column `geometrypoint` and click on `Edit`.
 7. At the bottom, select the transformation `Geo To Well-Known Text` and click on the button `+`. Click on `Preview` to preview the results. Then, click on `Update column`.

### Mapping

1. Go to the `Mapping` page and click on the lens `lenses.source1.hospitality`.
2. Let's map all the rows to a class. Click on the button `C+` for creating a mapping entry.
3. We need first to specify the subject as a template. Make sure the option `Template` is selected. Open the template menu and click on `Create new template`. Ontopic Studio automatically proposes the template `data:source1-hospitality/{h_id}` out of the lens name and the unique constraint on the column `h_id`. Accept it by clicking on `Create`.
4. Let's now assign a class. Make sure `Constant` is selected for the class. In the drop-down menu below select the class `schema:LodgingBusiness`. Click and save and you are having your first mapping entry!
