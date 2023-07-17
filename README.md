# tf-azure-resume

## My resume, inspired by "The Cloud Resume Challenge" - made in Azure using Terraform as much as possible

No prior experience with HTML, CSS or JS so the webpage will be a template which I will edit to my liking as we go and learn.

So far I have created the Azure infrastructure with Terraform; main.tf, appinsights.tf, cosmosdb.tf, functionapp.tf, cdn.tf, variables.tf. 

The Azure Functions API using C#. The API is designed to increment a counter stored in a Cosmos DB container.
The different components creating the Function API:
* **api.csproj:** This file defines the project configuration, including the target framework and Azure Functions version. It also specifies the required packages for working with Azure Functions and Cosmos DB.

* **Counter.cs:** This class represents the data model for the counter. It has properties for Id and Count, which will be used to store and track the visitor count in the Cosmos DB container.

* **ResumeCounter.cs:**  When triggered by an HTTP request, it retrieves the current counter value from the Cosmos DB container. It then increments the counter and serializes the updated counter object into JSON format. Finally, it returns an HTTP response with the updated counter as the content. This ensures that each time the function is called, the visitor count is incremented and the updated count is provided in the response.


The key components and concepts used in this code are:

HttpTrigger: This attribute decorates the Run method in ResumeCounter.cs and specifies that the function should be triggered by HTTP requests
CosmosDB: This attribute decorates the counter parameter and updatedCounter output parameter in Run method, specifying the connection settings and details for interacting with the Cosmos DB container.
HttpResponseMessage: This class is used to construct the HTTP response returned by the function, containing the serialized counter object as the content.

Overall, this code sets up an Azure Function API that receives HTTP requests, increments the visitor count stored in Cosmos DB, and returns the updated count in JSON format as the response.
