<?php include('includes/header.php')?>
<?php include('../includes/session.php')?>
<body>

	<?php include('includes/navbar.php')?>

	<?php include('includes/right_sidebar.php')?>

	<?php include('includes/left_sidebar.php')?>

	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pd-ltr-20">
			<div class="card-box pd-20 height-100-p mb-30">
				<div class="row align-items-center">
					<div class="col-md-4 user-icon">
					<img src="../vendors/images/welcomeback.png" alt="">
					</div>
					<div class="col-md-8">

						<?php $query= mysqli_query($conn,"select * from tblemployees where emp_id = '$session_id'")or die(mysqli_error());
								$row = mysqli_fetch_array($query);
						?>

						<h4 class="font-20 weight-500 mb-10 text-capitalize">
							<b>Welcome back! </b> <div class="weight-600 font-30 text-blue"><?php echo $row['FirstName']. " " .$row['LastName']; ?></div>
						</h4>
					</div>
				</div>
			</div>


						
		</div>
				<!-- </div>
			</div> -->

			<div class="card-box mb-30">
				<div class="pd-20">
					<h2 class="text-blue h4">ASSIGNED LEAVES</h2>
				</div>
				<div class="pb-20">
					<table class="data-table table stripe hover nowrap">
						<thead>
							<tr>
								<th>Lecturer FROM</th>
								<th>DATE FROM</th>
								<th>DATE TO</th>
								<th>NO OF DAYS</th>
								<th class="datatable-nosort">ACTION</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								
								 <?php 
                                    $sql = "SELECT id,no_of_days,leave_date,leave_end_date,FirstName,LastName from leavetype_tblemployees,tblemployees where leavetype_tblemployees.assignee_id='$session_id' AND leavetype_tblemployees.emp_id=tblemployees.emp_id and leavetype_tblemployees.assignee_status='PENDING'";
                                    $query = $dbh -> prepare($sql);
                                    $query->execute();
                                    $results=$query->fetchAll(PDO::FETCH_OBJ);
                                    $cnt=1;
                                    if($query->rowCount() > 0)
                                    {
                                    foreach($results as $result)
                                    {               ?>  
                                  <td><?php echo htmlentities($result->FirstName." ".$result->LastName);?></td>
                                  <td><?php echo htmlentities($result->leave_date);?></td>
								  <td><?php echo htmlentities($result->leave_end_date);?></td>
                                  <td><?php echo htmlentities($result->no_of_days);?></td>
                                
								   <td>
									  <div class="table-actions">
										<a title="VIEW" href="view_leave.php?leaveid=<?php echo htmlentities($result->id);?>" data-color="#265ed7"><i class="icon-copy dw dw-eye"></i></a>
									  </div>
								   </td>
							</tr>
							<?php $cnt++;} }?>  
						</tbody>
					</table>
			   </div>
			</div>

			<?php include('includes/footer.php'); ?>
		</div>
	</div>
	<!-- js -->

	<?php include('includes/scripts.php')?>
</body>
</html>