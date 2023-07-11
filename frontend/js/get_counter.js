window.addEventListener('DOMContentLoaded', (Event) =>{
    getVisitCount(); 
})

const functionApi = 'http://localhost:7071/api/ResumeCounter';

const getVisitCount = () => {
    let count = 30;
    fetch(functionApi).then(response => {
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