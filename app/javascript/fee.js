function fee(){

  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  itemPrice.addEventListener('input', function(){
    const price = itemPrice.value
    if (price >= 0 || price <= 0){ 

      let addTax = price * 0.1
      addTaxPrice.innerHTML = Math.floor(addTax)

      let proFit = price * 0.9
      profit.innerHTML = Math.floor(proFit)
    }
  })
}
window.addEventListener('load', fee)