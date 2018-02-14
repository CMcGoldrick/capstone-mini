var productTemplate = document.querySelector("#product-card");
var productContainer = document.querySelector(".row");

// productContainer.appendChild(productTemplate.content.cloneNode(true));
// productContainer.appendChild(productTemplate.content.cloneNode(true));
// productContainer.appendChild(productTemplate.content.cloneNode(true));

axios.get("http://localhost:3000/products").then(function(response) {
  var products = response.data;
  products.forEach(function(product) {
    var productClone = productTemplate.content.cloneNode(true);
    // productClone.querySelector(".card-title").innerText = product.title;
    productClone.querySelector(".name").innerText = product.name;
    productClone.querySelector(".description").innerText = product.description;
    productClone.querySelector(".description").innerText = product.description;
    productContainer.appendChild(productClone);
  });
});


