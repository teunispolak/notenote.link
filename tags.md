---
layout: post
title: Notes sorted by tag
permalink: /tags/
content-type: eg
---
###### test
<style>
.category-content a {
    text-decoration: none;
    <!-- color: #4183c4; -->
}

.category-content a:hover {
    text-decoration: underline;
    <!-- color: #4183c4; -->
}
</style>

<!-- <main> -->
<p>
    {% assign tags =  site.notes | map: 'tags' | join: ' '  | split: ' ' | uniq | sort_natural %}
    {% for tag in tags %}
        <h4 id="{{ tag }}">{{ tag | captalize }}</h4>
        {%- for note in site.notes -%}
            {%- if note.tags contains tag -%}
                <li style="padding-bottom: 0.0em; margin-left:20px; list-style: none;"><a href="{{note.url}}">{{ note.title }}</a></li>
            {%- endif -%}
        {%- endfor -%}
    {%- endfor -%}
    <br/>
    <br/>
<!-- </main>  -->
</p>
