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

#### First class mapping entry
 1. Go to the `Mapping` page and click on the lens `lenses.source1.hospitality`.
 2. Let's map all the rows to a class. Click on the button `C+` for creating a mapping entry.
 3. We need first to specify the subject as a template. Make sure the option `Template` is selected. Open the template menu and click on `Create new template`. Ontopic Studio automatically proposes the template `data:source1-hospitality/{h_id}` out of the lens name and the unique constraint on the column `h_id`. Accept it by clicking on `Create`.
 4. Let's now assign a class. Make sure `Constant` is selected for the class. In the drop-down menu below select the class `schema:LodgingBusiness`. Click and save and you are having your first mapping entry!

#### First data property mapping entry
 5. Let's now map the name in English to the lodging business. Let's create a property mapping entry for the same subject by clicking on the button `P+` on the right of the IRI template `data:source1-hospitality/{h_id}`.
 6. You should see that subject section is already filled with the same values as before. If it is not the case, you probably clicked on the other `P+` button at the top of the page. In that case, go back and click on the correct `P+` button.
 7. Select the property `schema:name` in the property drop-down menu.
 8. For the object, we want to direct map the value from the column `name_en`. Select `Literal` and the type `Column` and then the `name_en` in the column drop-down menu. 
 9. Notice that the datatype field get automatically filled after selecting the column as `xsd:string`. This is because the column type is `text` and, according to [R2RML](https://www.w3.org/TR/r2rml/#natural-mapping) character string types are mapped to that RDF datatype. However here we want to assign a language tag (en), so as to distinguish from the names in German and Italian. Select the value `@en` in the Datatype/Language drop-down menu and save the mapping entry.

#### First object property mapping entry
 10. Let's now map the default geometry of the lodging business. As previously, click on the button `P+` on the right of the IRI template `data:source1-hospitality/{h_id}`.
 11. Select the property `geo:defaultGeometry`.
 12. For object, you can see that the pre-selected kind value is not `Literal` as before but `IRI/BNode`. This is because the property `geo:defaultGeometry` is declared in the ontology as an object property, so it expects an IRI or a BNode as value. The type `Template` is also pre-selected because it is the most common mechanism for building an IRI as object. Let's keep it.
 13. We need to provide an IRI template for geometry objects. Here we have no plan to share the same geometries between lodging businesses, so let's create one geometry object per lodging business, using the unique constraint of the lens (`h_id`). In the template drop-down menu, click on  `Create new template`. This time we need to modify the default value suggested by the platform. Replace the text entry `data:source1-hospitality/` by `data:geo/source1-hospitality/` and click on `Create`. Save the mapping entry.

#### Geometry literal

 14. Let's now map the geometry value to the new IRI template. Since the subject is not the same as in the previous mapping entries, click on the `P+` button at the top the page.
 15. For the subject, select the template `data:geo/source1-hospitality/{h_id}`.
 16. For the property, select `geo:asWKT`.
 17. For the object, keep `Literal` as kind and select the column `geometrypoint`. For its datatype, select `geo:wktLiteral`. Save the mapping entry.


 #### Sub-classes of lodging businesses

 18. We now want to map to sub-classes of `schema:LodgingBusiness` depending on the values found in the column `h_type`. Let's create a new mapping entry. Click on `C+` on the right of the template `data:source1-hospitality/{h_id}`.
 19. For the class, we don't want to assign the same value to each lodging business found in the lens, so we cannot select the type `Constant`. Select instead the type `Dictionary`.
 20. For the column, select `h_type`.
 21. Let's now fill the first line of the dictionary. On the left field, insert the string `Camping` as found in the `h_type` column of the lens. In the right field, select the class `schema:Campground`. Everytime the value `Camping` is found in the column `h_type`, the lodging business will be declared instance of the class `schema:Campground`.
 22. Click on `+` for adding a new line. Map this time the value `HotelPension` to the class `schema:Hotel`.
 23. Map the value `BedBreakfast` to `schema:BedAndBreakfast`. Save the mapping entry.
