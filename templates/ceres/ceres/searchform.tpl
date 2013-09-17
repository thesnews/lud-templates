{#ceres/ceres/searchform.tpl#}

<form class="form-horizontal" method="get" action="{{'ceres:ceres/search'|url}}">

	<div class="control-group">
			<label class="control-label">Keywords</label>
		<div class="controls">
			<input type="text" name="q" class="input-large" value="{{searchParams.q}}" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label">Cuisine</label>
		<div class="controls">
			<select name="category" class="span4">
					<option value="">All</option>
				{% for category in categories %}
					<option value="{{ category.uid }}"{% if searchParams.category == category.uid %} selected {% endif %}>{{ category.name }}</option>
				{% endfor %}
			</select>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label">Location</label>
		<div class="controls">
			<input type="text" name="city_zip" class="input-large" value="{{searchParams.city_zip}}" placeholder="City or ZIP" />
		</div>
	</div>

	<div class="control-group">
		<label class="control-label">Price</label>
		<div class="controls">
			<select name="min_price" class="pricebox span4">
				{% for i in 1..5 %}
					<option value="{{ i }}"{% if searchParams.min_price == i %} selected {% endif %}>{{ config.get('ceres:rangeLabels')[(i-1)] }}</option>
				{% endfor %}
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<strong> - </strong>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<select name="max_price" class="pricebox span4">
				{% for i in 1..5 %}
					<option value="{{ i }}"{% if searchParams.max_price == i %} selected {% endif %}>{{ config.get('ceres:rangeLabels')[(i-1)] }}</option>
				{% endfor %}
			</select>
		</div>
	</div>

	<div class="control-group">
		<label class="control-label">Flames Cash</label>
		<div class="controls">
			<input type="checkbox" name="flames_cash" value="1"{% if searchParams.flames_cash %} checked{% endif %}/>
		</div>
	</div>






	<div class="control-group">
		<div class="controls">
			<input type="submit" value="Search Dining Guide" class="btn btn-primary" />
		</div>
	</div>

	<input type="hidden" name="sort" value="name asc" />

</form>