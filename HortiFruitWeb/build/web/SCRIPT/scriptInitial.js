function teste(){
    alert("Atestado.");
}

if(document.getElementById('frm_login')){
    document.getElementById('frm_login').addEventListener('submit', async function (event) {
        event.preventDefault(); 
        const formData = new FormData(event.target);
        const data = new URLSearchParams(formData).toString();
        await fetch("logar?"+data)
        .then(response => {
            if(response.ok){
                    console.log("Login bem-sucedido!");
                    window.location.href = "home";
            } else {
                 showPopupError();
            }
        })
        .catch(err => console.error("Erro em: ", err));  
    });
}


if(document.getElementById("form_registro")){
    document.getElementById("form_registro").addEventListener('submit', async function (event){
        event.preventDefault();
        const formDataRegistro = new FormData(event.target);
        let dataRegistro = new URLSearchParams(formDataRegistro).toString();
        await fetch("cadastrar",
        {
            method: "POST",
            body: dataRegistro,
            headers: { 'Content-Type':'application/x-www-form-urlencoded;charset=UTF-8' }

        })
        .then(res => {
            if(res.ok){
                 showPopupOk();
            } else {
                showPopupError();
            }
        });  
    });
}


function showPopupOk(){
    const popup = document.getElementById("popupOk");
    popup.classList.toggle("displayView");
}

function showPopupError(){
    const popup = document.getElementById("popupError");
    popup.classList.toggle("displayView");
}

