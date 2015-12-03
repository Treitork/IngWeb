<%@ include file="../fragments/header_admin.jspf" %>
	
	
	<aside id="sidebar" class="column" style="height: 1700px;">
		<form class="quick_search">
			<input type="text" value="Quick Search" onfocus="if(!this._haschanged){this.value=''};this._haschanged=true;">
		</form>
		<hr>
		<h3>Messages</h3>
		<ul class="toggle">
			<li class="icn_new_article"><a href="#clear">New Message</a></li>
			<li class="icn_edit_article"><a href="#">Edit Message</a></li>
			<li class="icn_categories"><a href="#tab1">List Messages</a></li>
		</ul>
		<h3>Votes</h3>
		<ul class="toggle">
			<li class="icn_new_article"><a href="#">New Vote</a></li>
			<li class="icn_edit_article"><a href="#">Edit Vote</a></li>
			<li class="icn_categories"><a href="#votes">List Votes</a></li>
		</ul>
		<h3>Users</h3>
		<ul class="toggle">
			<li class="icn_add_user"><a href="#">Add New User</a></li>
			<li class="icn_view_users"><a href="#">View Users</a></li>
			<li class="icn_profile"><a href="#">Your Profile</a></li>
		</ul>
		<h3>Admin</h3>
		<ul class="toggle">
			<li class="icn_settings"><a href="#">Options</a></li>
			<li class="icn_security"><a href="#">Security</a></li>
		</ul>
	</aside><!-- end of sidebar -->
	
	<section id="main" class="column" style="height: 1700px;">
		
		<article class="module width_full">
			<header><h3>Stats</h3></header>
			<div class="module_content">
				<article class="stats_graph">
					<img src="http://chart.apis.google.com/chart?chxr=0,0,3000&amp;chxt=y&amp;chs=520x140&amp;cht=lc&amp;chco=76A4FB,80C65A&amp;chd=s:Tdjpsvyvttmiihgmnrst,OTbdcfhhggcTUTTUadfk&amp;chls=2|2&amp;chma=40,20,20,30" width="520" height="140" alt="">
				</article>
				
				<article class="stats_overview">
					<div class="overview_today">
						<p class="overview_day">Today</p>
						<p class="overview_count">1,876</p>
						<p class="overview_type">Hits</p>
						<p class="overview_count">2,103</p>
						<p class="overview_type">Views</p>
					</div>
					<div class="overview_previous">
						<p class="overview_day">Yesterday</p>
						<p class="overview_count">1,646</p>
						<p class="overview_type">Hits</p>
						<p class="overview_count">2,054</p>
						<p class="overview_type">Views</p>
					</div>
				</article>
				<div class="clear"></div>
			</div>
		</article><!-- end of stats article -->
		
		<article class="module width_3_quarter">
		<header><h3 class="tabs_involved">List Messages</h3>
		</header>

		<div class="tab_container">
			<div id="tab1" class="tab_content" style="display: block;">
			<table class="tablesorter" cellspacing="0" > 
			<thead> 
				<tr> 
   					<th class="header"></th> 
    				<th class="header">User</th> 
    				<th class="header">Subject</th> 
    				<th class="header">Recived</th> 
    				<th class="header">Actions</th> 
				</tr> 
			</thead> 
			<tbody> 
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>Lorem Ipsum Dolor Sit Amet</td> 
    				<td>pepe</td> 
    				<td>5th April 2011</td> 
    				<td><input type="image" src="resources/img/img_admin/icn_edit.png" title="Edit"><input type="image" src="resources/img/img_admin/icn_trash.png" title="Trash"></td> 
				</tr> 
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>Ipsum Lorem Dolor Sit Amet</td> 
    				<td>paco</td> 
    				<td>6th April 2011</td> 
   				 	<td><input type="image" src="resources/img/img_admin/icn_edit.png" title="Edit"><input type="image" src="resources/img/img_admin/icn_trash.png" title="Trash"></td> 
				</tr>
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>Sit Amet Dolor Ipsum</td> 
    				<td>pedro</td> 
    				<td>10th April 2011</td> 
    				<td><input type="image" src="resources/img/img_admin/icn_edit.png" title="Edit"><input type="image" src="resources/img/img_admin/icn_trash.png" title="Trash"></td> 
				</tr> 
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>Dolor Lorem Amet</td> 
    				<td>marta</td> 
    				<td>16th April 2011</td> 
   				 	<td><input type="image" src="resources/img/img_admin/icn_edit.png" title="Edit"><input type="image" src="resources/img/img_admin/icn_trash.png" title="Trash"></td> 
				</tr>
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>Dolor Lorem Amet</td> 
    				<td>luis</td> 
    				<td>16th April 2011</td> 
   				 	<td><input type="image" src="resources/img/img_admin/icn_edit.png" title="Edit"><input type="image" src="resources/img/img_admin/icn_trash.png" title="Trash"></td> 
				</tr>  
			</tbody> 
			</table>
			</div><!-- end of #tab1 -->
			
		</div><!-- end of .tab_container -->
		
		</article><!-- end of list messages -->
		
		<div class="clear"></div>
		
		<article class="module width_full">
			<header><h3>New Message</h3></header>
				<div class="module_content">
						<fieldset>
							<label>From</label>
							<input type="text">
						</fieldset>
						<fieldset>
							<label>To</label>
							<input type="text" >
						</fieldset>
						<fieldset>
							<label>Subject</label>
							<textarea rows="12"></textarea>
						</fieldset>
				</div>
			<footer>
				<div class="submit_link">
					<input type="submit" value="Publish" class="alt_btn">
					<input type="submit" value="Reset">
				</div>
			</footer>
		</article><!-- end of post new article -->
		
		<article class="module width_3_quarter">
		<header><h3 class="tabs_involved">List Votes</h3>
		</header>

		<div class="tab_container">
			<div id="votes" class="tab_content" style="display: block;">
			<table class="tablesorter" cellspacing="0" > 
			<thead> 
				<tr> 
   					<th class="header"></th> 
    				<th class="header">User</th> 
    				<th class="header">Rol</th> 
    				<th class="header">Mark(0-5)</th> 
    				<th class="header">Actions</th> 
				</tr> 
			</thead> 
			<tbody> 
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>Lorem Ipsum Dolor Sit Amet</td> 
    				<td>student</td> 
    				<td>2</td> 
    				<td><input type="image" src="resources/img/img_admin/icn_edit.png" title="Edit"><input type="image" src="resources/img/img_admin/icn_trash.png" title="Trash"></td> 
				</tr> 
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>Ipsum Lorem Dolor Sit Amet</td> 
    				<td>teacher</td> 
    				<td>1</td> 
   				 	<td><input type="image" src="resources/img/img_admin/icn_edit.png" title="Edit"><input type="image" src="resources/img/img_admin/icn_trash.png" title="Trash"></td> 
				</tr>
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>Sit Amet Dolor Ipsum</td> 
    				<td>teacher</td> 
    				<td>5</td> 
    				<td><input type="image" src="resources/img/img_admin/icn_edit.png" title="Edit"><input type="image" src="resources/img/img_admin/icn_trash.png" title="Trash"></td> 
				</tr> 
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>Dolor Lorem Amet</td> 
    				<td>student</td> 
    				<td>4</td> 
   				 	<td><input type="image" src="resources/img/img_admin/icn_edit.png" title="Edit"><input type="image" src="resources/img/img_admin/icn_trash.png" title="Trash"></td> 
				</tr>
				<tr> 
   					<td><input type="checkbox"></td> 
    				<td>Dolor Lorem Amet</td> 
    				<td>teacher</td> 
    				<td>3</td> 
   				 	<td><input type="image" src="resources/img/img_admin/icn_edit.png" title="Edit"><input type="image" src="resources/img/img_admin/icn_trash.png" title="Trash"></td> 
				</tr>  
			</tbody> 
			</table>
			</div><!-- end of #tab1 -->
			
		</div><!-- end of .tab_container -->
		
		</article><!-- end of list votes -->
		
		

<%@ include file="../fragments/footer.jspf" %>