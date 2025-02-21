
import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["fornecedoresList"]  // Especificamos qual elemento queremos atualizar
  static values = { fornecedores: Array } // Definimos um valor para armazenar os dados

  logMessage(event) {

    const fornecedor = JSON.parse(this.element.dataset.anyfornecedores);

    let fornecedoresUnicos = [];
    const div = this.fornecedoresListTarget
    if (div.textContent.trim() === "") {
      fornecedor.map((ele) => {
        this.fornecedoresValue = [...this.fornecedoresValue, ele];
        fornecedoresUnicos = [...new Set(this.fornecedoresValue)];
      });

      fornecedoresUnicos.forEach((fornecedor) => {
        const li = document.createElement("li");
        li.innerHTML = "<strong>Fornecedore:</strong> " + fornecedor;
        this.fornecedoresListTarget.appendChild(li);
      });
  
    } else {
      div.innerHTML= ""
    }

  }
}
