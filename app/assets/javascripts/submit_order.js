function makeOrder() {
  let order = {}
  if (document.querySelector('input[name="soup"]:checked')) order.soup = document.querySelector('input[name="soup"]:checked').value;
  if (document.querySelector('input[name="main"]:checked')) order.main = document.querySelector('input[name="main"]:checked').value;
  if (document.querySelector('input[name="drink"]:checked')) order.drink = document.querySelector('input[name="drink"]:checked').value;
  $.ajax({
    type: "POST",
    url: "/order_items",
    data: { order: order }
  })
}
