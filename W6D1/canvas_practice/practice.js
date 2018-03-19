document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById("mycanvas");
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'SeaGreen';
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = "LightStealBlue";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "LightBlue";
  ctx.fill();



});
