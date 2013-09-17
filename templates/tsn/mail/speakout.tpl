{#tsn/mail/speakout.tpl#}


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="{{ 'gfn-tarheel/css/master.css'|asset }}" media="screen, projection" />
</head>

<body>
    <div class="mb" style="width:298px;">
        <h6 class="liner mmb">{{ form.subject }}</h6>

        <form method="post" action="{{ form.urlSubmit }}" enctype="multipart/form-data" target="_top">
            <input type="hidden" name="mailkey" value="{{ key }}" /> <input type="hidden" name="sender_name" value="Kvetch Submitter" />

            <p class="aside">{{ form.instructions }}</p>

            <table class="formwrap">
                <tr>
                    <th style="width:60px"><label for="sender">Email</label></th>

                    <td>{% if form.sender %} {{ form.sender }} {% else %} <input type="text" size="15" name="sender" /> {% endif %}</td>
                </tr>

                <tr>
                    <th style="width:60px"><label for="message">Kvetch</label></th>

                    <td>
                    <textarea rows="8" cols="50" name="message" style="width:100%;"></textarea></td>
                </tr>

                <tr>
                    <th style="width:60px"></th>

                    <td><input type="submit" value="Submit" /></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
