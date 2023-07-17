window.addEventListener('DOMContentLoaded', (Event) =>{
    getVisitCount(); 
})
                        
const functionApiUrl = 'https://tfazresume-function.azurewebsites.net/api/ResumeCounter?code=3CNOgwTd6Bt2jdjV2zQWshobdG3nCu1PTeneT-afntz_AzFufdNk4w==';
const localFunctionApi = 'http://localhost:7071/api/ResumeCounter';

const getVisitCount = () => {
    let count = 30;
    fetch(functionApiUrl).then(response => {
        return response.json()
    }).then(response =>{
        console.log("Website called Function API.");
        count = response.count;
        document.getElementById("counter").innerText = count;

    }).catch(function(error){
        console.log(error);
    });
    return count;
}