window.addEventListener('DOMContentLoaded', (Event) =>{
    getVisitCount(); 
})
                        
const functionApiUrl = 'https://azureresume-function.azurewebsites.net/api/ResumeCounter?code=j6V3PgSkIfLajU_rhFJmAm0qNeVQjEpvSBl5X89CDSF_AzFuspj5_g==';
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