{#roost/roost/_sidebar.tpl#}


<div class="text-center">
    <a href="#">
        <img src="http://placehold.it/300x250" />
    </a>
</div>
<hr class="double spacer">

{% set saleRange = [
    '0': 'Less than $99,999',
    '1': '$100,000 to $149,000',
    '2': '$150,000 to $199,999',
    '3': '$200,000 to $299,999',
    '4': 'More than $300,000'
] %}
{% if showSearch %}
<h3 class="sidebar-header">Quick Search</h3>
<div class="sidebar-wrapper">
    <div style="margin: 0 10px;">
        <div class="row-fluid">
            <div class="span3" style="text-align:right;">
                Sale/Rent
            </div>
            <div class="span9">
                <select data-action="change-quicksearch">
                    <option value="pr">For Rent</option>
                    <option value="ps">For Sale</option>
                </select>
            </div>
        </div>
    </div>
    <form method="get" action="{{ 'roost:roost/search'|url }}" id="qs-rent">
        <input type="hidden" name="adv" value="" />
        <input type="hidden" name="pr" value="1" />
        <div class="row-fluid">
            <div class="span3" style="text-align:right;">Keywords</div>
            <div class="span9">
                <input type="text" name="keywords" value="{{searchParams['keywords']}}" placehoder="Complex title, description" />
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3" style="text-align:right;">Type</div>
            <div class="span9">
                <select name="types[]" multiple>
                {% for type in ['house', 'apartment', 'duplex', 'room', 'condo', 'townhome'] %}
                    {% if not type|in(['condo','townhome']) %}
                        <option value="{{ type }}" {% if type|in(searchParams.types) %}checked="selected"{% endif %}>
                            {{ type|capitalize }}
                        </option>
                    {% endif %}
                {% endfor %}
                </select>
            </div>
        </div>

        <hr class="spacer" />

        <div class="row-fluid">
            <div class="span3" style="text-align:right;">
                Min Rent
            </div>
            <div class="span3">
                <select name="min_rent">
                    {% for i in 100|range(4000, 100) %}
                        <option value="{{ i }}" {% if searchParams['min_rent']|default('100') == i %} selected="selected" {% endif %}>${{ i }}</option>
                    {% endfor %}
                </select>
            </div>
            <div class="span3" style="text-align:right;">
                Max Rent
            </div>
            <div class="span3">
                <select name="max_rent">
                    {% for i in 100|range(4000, 100) %}
                        <option value="{{ i }}" {% if searchParams['max_rent']|default('1000') == i %} selected="selected" {% endif %}>${{ i }}</option>
                    {% endfor %}
                </select>
            </div>
        </div>

        <hr class="half spacer" />

        <div class="row-fluid">
            <div class="span3" style="text-align:right">
                Beds
            </div>
            <div class="span3">
                <input type="text" name="bedrooms" class="span10" value="{{ searchParams.bedrooms }}" />
            </div>
            <div class="span3" style="text-align:right">
                Baths
            </div>
            <div class="span3">
                <input type="text" name="bathrooms" class="span10" value="{{ searchParams.bathrooms }}" />
            </div>
        </div>
        <hr class="half spacer" />
        <div class="pull-right">
            <input type="submit" value="Search" class="btn btn-duke" />
        </div>
        <hr class="spacer" />
    </form>
    <form method="get" action="{{ 'roost:roost/search'|url }}" id="qs-sale" class="hidden">
        <input type="hidden" name="adv" value="" />
        <input type="hidden" name="ps" value="1" />
        <div class="row-fluid">
            <div class="span3" style="text-align:right;">Keywords</div>
            <div class="span9">
                <input type="text" name="keywords" value="{{searchParams['keywords']}}" placehoder="Complex title, description" />
            </div>
        </div>
        <div class="row-fluid">
            <div class="span3" style="text-align:right;">Type</div>
            <div class="span9">
                <select name="types[]" multiple>
                {% for type in ['house', 'apartment', 'duplex', 'room', 'condo', 'townhome'] %}
                    {% if type|in(['house','condo','townhome']) %}
                        <option value="{{ type }}" {% if type|in(searchParams.types) %}checked="selected"{% endif %}>
                            {{ type|capitalize }}
                        </option>
                    {% endif %}
                {% endfor %}
                </select>
            </div>
        </div>

        <hr class="spacer" />

        <div class="row-fluid">
            <div class="span3" style="text-align:right;">
                Sale Price
            </div>
            <div class="span9">
                <select name="sale_range">
                    {% for i,label in saleRange %}
                        <option value="{{ i }}" {% if searchParams['sale_range'] == i %} selected{% endif %}>{{ label }}</option>
                    {% endfor %}
                </select>
            </div>
        </div>

        <hr class="half spacer" />

        <div class="row-fluid">
            <div class="span3" style="text-align:right">
                Beds
            </div>
            <div class="span3">
                <input type="text" name="bedrooms" class="span10" value="{{ searchParams.bedrooms }}" />
            </div>
            <div class="span3" style="text-align:right">
                Baths
            </div>
            <div class="span3">
                <input type="text" name="bathrooms" class="span10" value="{{ searchParams.bathrooms }}" />
            </div>
        </div>
        <hr class="half spacer" />
        <div class="pull-right">
            <input type="submit" value="Search" class="btn btn-duke" />
        </div>
        <hr class="spacer" />
    </form>
</div>
{% endif %}
