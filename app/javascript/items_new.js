function priceCalc() {
    const itemPrice = document.getElementById("item-price").value
    if (itemPrice >= 300) {
        calc = Math.floor(itemPrice / 10)
        document.getElementById('add-tax-price').innerHTML = calc
        document.getElementById('profit').innerHTML = itemPrice - calc
    }else{
        document.getElementById('add-tax-price').innerHTML = null
        document.getElementById('profit').innerHTML = null
    }
}

setInterval(priceCalc, 10)