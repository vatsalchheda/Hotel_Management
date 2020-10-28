<?php
include "db.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/bdd89edb33.js"></script>
    <link
      href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900"
      rel="stylesheet"
    />
    <link href="css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="Search.css" />
    <title>Sunrise Hotels</title>
</head>
<body>
  <?php include "include/navigation.php" ?>

  <?php 

  $room_category=['simple','deluxe','suite'];
  $category_count=[];

  for($i=0; $i<3; $i++){
    $query="SELECT * FROM $room_category[$i]";
    $select_all_rooms=mysqli_query($con, $query);
    if (!$select_all_rooms || mysqli_num_rows($select_all_rooms) == 0){
      $category_count[$i]=0;
    }
    else {
      $category_count[$i]=mysqli_num_rows($select_all_rooms);
    }
  }

  if(isset($_POST['search'])){
    $branch_id=$_POST['branch_id'];
    $check_in=$_POST['check_in'];
    $check_out=$_POST['check_out'];

    for($i=0; $i<3; $i++){
      $query="SELECT $room_category[$i].room_id FROM $room_category[$i] JOIN rooms ON $room_category[$i].room_id=rooms.room_id WHERE (rooms.branch_id='{$branch_id}' AND $room_category[$i].room_id NOT IN (SELECT forr.room_id FROM $room_category[$i] JOIN forr ON $room_category[$i].room_id=forr.room_id WHERE (('{$check_in}' BETWEEN forr.check_in_date AND forr.check_out_date) OR ('{$check_out}' BETWEEN forr.check_in_date AND forr.check_out_date))))";
      $select_all_rooms=mysqli_query($con, $query);

      if (!$select_all_rooms || mysqli_num_rows($select_all_rooms) == 0){
        $category_count[$i]=0;
      }
      else {
        $category_count[$i]=mysqli_num_rows($select_all_rooms);
      }
    }
  }
?>
  <div class="SearchContainer">
    <form action="" method="post" enctype="multipart/form-data">
      <br><br><br>
      <div class="FormDiv">
          <h1>View Your Booking</h1>
          <br>
          <div>
            <label>Enter your Booking ID</label>
            <input type="number" id="booking_id" name="booking_id"  required>
            <input type="submit" name="search" class="btn--green btn-submit" onclick="submitbutton()">
          </div>
      </div>
    </form>
  </div>
  <!-- SIMRN CODE OF INVOICE -->
        <?php include "include/footer.php" ?>

       <!-- jQuery -->
    <script src="js/jquery-2.1.4.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap-3.1.1.min.js"></script>
    <script type="text/javascript">
      function check() {
        if(document.getElementById('check_in').value >= document.getElementById('check_out').value) {
          alert('Check out must be after check in!')
          document.getElementById('check_out').value= document.getElementById('check_in').value;
        }
      }
      function submitbutton() {
        setTimeout(() => {
        console.log("SUBMIT")
        document.getElementById('row').class('block')
        }, 2000);
      }
    </script>
</body>
</html>