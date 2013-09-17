{#roost/roost/_search_form.tpl#}


<ul class="nav nav-tabs search-tabs">
    <li{% if not searchParams['ps'] %} class="active"{% endif %}><a href="#forrent" data-toggle="tab">For Rent</a></li>
    <li{% if searchParams['ps'] %} class="active"{% endif %}><a href="#forsale" data-toggle="tab">For Sale</a></li>
</ul>
<div class="tab-content">
    <div class="tab-pane{% if not searchParams['ps'] %} active{% endif %}" id="forrent">
        <form method="get" action="{{ 'roost:roost/search'|url }}" class="search">
            <input type="hidden" name="adv" value="{% if advanced %}1{% endif %}" />
            <input type="hidden" name="pr" value="1" />

            <h2>Basic Options</h2>
            <div class="option-wrapper">
                <div class="row-fluid">

                    <div class="span3">
                        <fieldset>
                            <h5>Housing Type</h5>
                            {% for type in housingTypes %}
                                {% if not type|in(['condo','townhome']) %}
                                    <label for="{{ type }}">
                                        <input type="checkbox" name="types[]" value="{{ type }}" id="{{ type }}" {% if type|in(searchParams.types) %}checked="checked"{% endif %}/>
                                        {{ type|capitalize }}
                                    </label>
                                {% endif %}
                            {% endfor %}
                        </fieldset>
                    </div>

                    <div class="span3">
                        <fieldset>
                            <h5>Price</h5>
                            <select name="min_rent" id="min_rent">
                                {% for i in 100|range(4000, 100) %}
                                    <option value="{{ i }}" {% if searchParams['min_rent']|default('100') == i %} selected="selected" {% endif %}>${{ i }}</option>
                                {% endfor %}
                            </select>
                            to
                            <select name="max_rent" id="max_rent">
                                {% for i in 100|range(4000, 100) %}
                                    <option value="{{ i }}" {% if searchParams['max_rent']|default('1000') == i %} selected="selected" {% endif %}>${{ i }}</option>
                                {% endfor %}
                            </select>
                        </fieldset>
                    </div>

                    <div class="span3">
                        <fieldset>
                            <h5>Beds & Baths</h5>
                            <div class="row-fluid">
                                    <label for="beds">Number of Beds</label>
                                    <input type="text" name="bedrooms" id="beds" placeholder="Num. of Beds" value="{{ searchParams.bedrooms }}" />
                            </div>
                            <div class="row-fluid">
                                    <label for="baths">Number of Baths</label>
                                    <input type="text" name="bathrooms" id="baths" placeholder="Num. of Baths" value="{{ searchParams.bathrooms }}" />
                            </div>
                        </fieldset>
                    </div>
                    <div class="span3">
                        <fieldset>
                            <h5>Keywords</h5>
                            <input type="text" name="keywords" value="{{searchParams['keywords']}}" placehoder="Complex title, description" />
                        </fieldset>
                        
                        <hr class="spacer" />

                        <fieldset>
                            <h5>Distance from Liberty</h5>
                            <select name="chapel_distance">
                                <option value="">Less than...</option>
                                {% for i in [5,10,15,20,25] %}
                                    <option value="{{i}}"{% if searchParams['chapel_distance'] == i %} selected{%endif%}>{{i}} miles</option>
                                {% endfor %}
                            </select>
                        </fieldset>
                        
                    </div>
                </div><!-- end of row-fluid -->
            </div>
			<hr class="spacer" />
            <h2 data-action="show-advanced"><img src="{{ 'assets/dist/images/plus-sign.png'|asset }}" style="max-width:16px;position:relative;top:-2px;" /> Advanced Options</h2>
            <div class="option-wrapper{% if not advanced %} hide{% endif %} advanced-options">
                <div class="row-fluid">

                    <div class="span3">
                        <fieldset>
                            <h5>Unit</h5>
                            {% for key, val in advancedAmenities['Unit'] %}
                                <label for="{{ key }}">
                                    <input type="checkbox" name="{{ key }}" value="1" id="{{ key }}" {% if searchParams[key] == 1 %} checked="checked"{% endif %}/>
                                    {{ val }}
                                </label>
                            {% endfor %}
                        </fieldset>
                        <hr class="spacer" />
                     </div>
                     <div class="span3">
                        <fieldset>
                            <h5>Athletic</h5>
                            {% for key, val in advancedAmenities['Athletic'] %}
                                <label for="{{ key }}">
                                    <input type="checkbox" name="{{ key }}" value="1" id="{{ key }}" {% if searchParams[key] == 1 %} checked="checked"{% endif %}/>
                                    {{ val }}
                                </label>
                            {% endfor %}
                        </fieldset>
                    </div>


                    <div class="span3">
                        <fieldset>
                            <h5>Community</h5>
                            {% for key, val in advancedAmenities['Community'] %}
                                <label for="{{ key }}">
                                    <input type="checkbox" name="{{ key }}" value="1" id="{{ key }}" {% if searchParams[key] == 1 %} checked="checked"{% endif %}/>
                                    {{ val }}
                                </label>
                            {% endfor %}
                        </fieldset>
                        <hr class="spacer" />
                     </div>
                     <div class="span3">
                        <fieldset>
                            <h5>Pets</h5>
                            {% for key, val in advancedAmenities['Pets'] %}
                                <label for="{{ key }}">
                                    <input type="checkbox" name="{{ key }}" value="1" id="{{ key }}" {% if searchParams[key] == 1 %} checked="checked"{% endif %}/>
                                    {{ val }}
                                </label>
                            {% endfor %}
                        </fieldset>

						<hr class="spacer"/>

                        <fieldset>
                            <h5>Square Footage</h5>
                            <input type="text" name="square_foot_min" />
                            <p>To</p>
                            <input type="text" name="square_foot_max" />
                        </fieldset>

                    </div>
                </div>
            </div>

            <div class="button-bar">
                <input type="submit" value="Search" class="btn btn-lud" />
                <input type="reset" value="Reset All"  class="btn btn-lud" />
            </div>
        </form>
    </div>
    <div class="tab-pane{% if searchParams['ps'] %} active{% endif %}" id="forsale">
        <form method="get" action="{{ 'roost:roost/search'|url }}" class="search">
            <input type="hidden" name="adv" value="{% if advanced %}1{% endif %}" />
            <input type="hidden" name="ps" value="1" />

            <h2>Basic Options</h2>
            <div class="option-wrapper">
                <div class="row-fluid">

                    <div class="span3">
                        <fieldset>
                            <h5>Housing Type</h5>
                            {% for type in housingTypes %}
                                {% if type|in(['house','condo','townhome']) %}
                                    <label for="{{ type }}">
                                        <input type="checkbox" name="types[]" value="{{ type }}" id="{{ type }}" {% if type|in(searchParams.types) %}checked="checked"{% endif %}/>
                                        {{ type|capitalize }}
                                    </label>
                                {% endif %}
                            {% endfor %}
                        </fieldset>
                    </div>

                    <div class="span3">
                        <fieldset>
                            <h5>Price</h5>
                            <select name="sale_range">
                                {% for i,label in saleRange %}
                                    <option value="{{ i }}" {% if searchParams['sale_range'] == i %} selected{% endif %}>{{ label }}</option>
                                {% endfor %}
                            </select>
                        </fieldset>
                    </div>

                    <div class="span3">
                        <fieldset>
                            <h5>Beds & Baths</h5>
                            <div class="row-fluid">
                                <div class="span4">
                                    <label for="beds">Beds</label>
                                </div>
                                <div class="span8">
                                    <input type="text" name="bedrooms" id="beds" value="{{ searchParams.bedrooms }}" />
                                </div>
                            </div>
                            <div class="row-fluid">
                                <div class="span4">
                                    <label for="baths">Baths</label>
                                </div>
                                <div class="span8">
                                    <input type="text" name="bathrooms" id="baths" value="{{ searchParams.bathrooms }}" />
                                </div>
                            </div>
                        </fieldset>
                    </div>

                    <div class="span3">
                        <fieldset>
                            <h5>Keywords</h5>
                            <input type="text" name="keywords" value="{{searchParams['keywords']}}" placehoder="Complex title, description" />
                        </fieldset>
                        <hr class="spacer" />
						<fieldset>
                            <h5>Distance from Liberty</h5>
                            <select name="chapel_distance">
                                <option value="">Less than...</option>
                                {% for i in [5,10,15,20,25] %}
                                    <option value="{{i}}"{% if searchParams['chapel_distance'] == i %} selected{%endif%}>{{i}} miles</option>
                                {% endfor %}
                            </select>
                        </fieldset>
                    </div>
                </div><!-- end of row-fluid -->
            </div>

            <h2 data-action="show-advanced"><img src="{{ 'assets/dist/images/plus-sign.png'|asset }}" style="max-width:16px;position:relative;top:-2px;" /> Advanced Options</h2>
            <div class="option-wrapper{% if not advanced %} hide{% endif %} advanced-options">
                <div class="row-fluid">
                    <div class="span3">
                        <fieldset>
                            <h5>Unit</h5>
                            {% for key, val in saleAmenities['Unit'] %}
                                <label for="ps{{ key }}">
                                    <input type="checkbox" name="{{ key }}" value="1" id="ps{{ key }}" {% if searchParams[key] == 1 %} checked="checked"{% endif %}/>
                                    {{ val }}
                                </label>
                            {% endfor %}
                        </fieldset>
                        <hr class="spacer" />
                    </div>
                    <div class="span3">
                        <fieldset>
                            <h5>Community</h5>
                            {% for key, val in saleAmenities['Community'] %}
                                <label for="ps{{ key }}">
                                    <input type="checkbox" name="{{ key }}" value="1" id="ps{{ key }}" {% if searchParams[key] == 1 %} checked="checked"{% endif %}/>
                                    {{ val }}
                                </label>
                            {% endfor %}
                        </fieldset>
                    </div>

                    <div class="span3">
                        <fieldset>
                            <h5>Athletic</h5>
                            {% for key, val in saleAmenities['Athletic'] %}
                                <label for="ps{{ key }}">
                                    <input type="checkbox" name="{{ key }}" value="1" id="ps{{ key }}" {% if searchParams[key] == 1 %} checked="checked"{% endif %}/>
                                    {{ val }}
                                </label>
                            {% endfor %}
                        </fieldset>
                        <hr class="spacer" />
                     </div>
                     <div class="span3">
                        <fieldset>
                            <h5>Square Footage</h5>
                            <div class="row-fluid">
                                <div class="span3">
                                    <input type="text" name="square_foot_min" />
                                </div>
                                <div class="span4 text-center">
                                    to
                                </div>
                                <div class="span3">
                                    <input type="text" name="square_foot_max" />
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>

            <div class="button-bar">
                <input type="submit" value="Search" class="btn btn-lud" />
                <input type="reset" value="Reset All"  class="btn btn-lud" />
            </div>
        </form>
    </div>
</div>
