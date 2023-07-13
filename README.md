# tf-azure-resume

## My resume, inspired by "the cloud resume challenge" - made in Azure using Terraform as much as possible

No prior experience with HTML, CSS or JS so the webpage will be a template which iI will edit to my liking as we go and learn.

So far I have created the Terraform files main.tf, appinsights.tf, cosmosdb.tf, functionapp.tf, variables.tf and Azure Functions API using C#. The API is designed to increment a counter stored in a Cosmos DB container.

The different components creating the Function API:

* **api.csproj:** This file defines the project configuration, including the target framework and Azure Functions version. It also specifies the required packages for working with Azure Functions and Cosmos DB.

* **Counter.cs:** This class represents the data model for the counter, with properties for Id and Count. It uses the JsonProperty attribute to map the properties to corresponding fields in the Cosmos DB documents.

* **ResumeCounter.cs:** This class contains the main function, Run, which is triggered by an HTTP request. It retrieves the current counter value from the Cosmos DB container, increments it, and returns the updated counter value as an HTTP response.

To accomplish this I'm using the Microsoft.Azure.WebJobs.Extensions.CosmosDB package to integrate with Cosmos DB. It establishes a connection to the Cosmos DB account using the connection string specified in the local.settings.json file *(gitignored)*. The function retrieves the counter document from the container, increments the count, and updates the document in the container.
