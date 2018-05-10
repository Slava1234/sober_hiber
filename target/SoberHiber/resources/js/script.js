$(function () {

    var locationURL = location.origin + location.pathname;

    // operations with comments
    $('.save-comment').click(function () {

        var cvId = $(this).closest('tr').find('.cv_id').text();
        var commentValue = $(this).parent().find('textarea').val();

        var commentZone = $(this).closest('.text-size-14').find('.cv-row-comment');
        var commentDate = $(this).closest('.text-size-14').find('.cv-row-comment-date');

        $.ajax({
            url: locationURL + '/cv/update-comment/' + cvId,
            type: 'POST',
            data: {
                comment: commentValue
            },
            dataType: 'text',
            success: function (response) {
                console.log("success from send " + response);
                $.ajax({
                    url: locationURL + '/cv/get-comment/' + cvId,
                    type: 'POST',
                    dataType: 'text',
                    success: function (response) {
                        console.log("updated comment = " + response);

                        var res = JSON.parse(response);

                        commentZone.text(res.comment);
                        commentDate.text(res.last_comment_update);


                    },
                    error: function (error) {
                        console.log("error from get comment: " + error);
                    }
                });
            },
            error: function (error) {
                console.log("error from update comment : " + error);
            }
        });
    });


    // get cv data by id
    $('.fio').click(function () {
        if (locationURL.search(/bookmarks/)) {
            locationURL = locationURL.replace("bookmarks", '');
        }

        var cvId = $(this).closest('tr').find('.cv_id').text();
        $.ajax({
            url: locationURL + '/cv/get-cv/' + cvId,
            type: 'POST',
            data: '',
            contentType: "application/json",
            dataType: 'text',
            success: function (response) {
                var res = JSON.parse(response);

                var fio = res.fio;
                var birthdate = res.birthdate;
                var phone = res.phone;
                var email = res.email;
                var sellary = res.sellary;
                var experiance_years = res.experiance_years;
                var experiance_places = res.experiance_places;
                var skills = res.skills;
                var about = res.about;
                var comment = res.comment;
                var filename = res.filename;


                $('.cv-view-fio').text(fio);
                $('.cv-view-email').text(email);
                $('.cv-view-phone').text(phone);
                $('.cv-view-sellary').text(sellary);
                $('.cv-view-birthday').text(birthdate);
                $('.cv-view-experiance-years').text(experiance_years);
                $('.cv-view-experiance-place').text(experiance_places);
                $('.cv-view-skills').text(skills);
                $('.cv-view-about').text(about);
                $('.cv-view-comment').text(comment);


                var filenameArr = filename.split("\\");

                /**
                 * set link to download file
                 * if file doesn't present than remove download link
                 */
                if (filenameArr[filenameArr.length - 1] != 'null')
                    $('.cv-view-file-download').show().attr('href', locationURL + filename);
                else
                    $('.cv-view-file-download').hide();



                // highlight searched words
                var mark = function() {

                    // Read the keyword
                    var keyword = $("#cv-data-table_filter input[type='search']").val();

                    // Determine selected options
                    /*var options = {};
                    $("input[name='opt[]']").each(function() {
                        options[$(this).val()] = $(this).is(":checked");
                    });*/

                    // Remove previous marked elements and mark
                    // the new keyword inside the context
                    var context = "#dataInfo";
                    $(context).unmark({
                        done: function() {
                            $(context).mark(keyword);
                        }
                    });
                };

                mark();

            },
            error: function (error) {
                console.log("error from update comment : " + error);
            }
        });
    });


    var cvId;
    var fio;
    var email;
    var phone;
    var sellary;
    var birthdate;
    var experiance_years;
    var experiance_places;
    var skills;
    var about;
    var comment;
    var birth;

    var editable_fio;
    var editable_email;
    var editable_phone;
    var editable_sellary;
    var editable_birthdate;
    var editable_experiance_years;
    var editable_experiance_places;
    var editable_skills;
    var editable_about;
    var editable_comment;
    var editable_birth;


    $('.edit-cv-btn').click(function () {

        cvId = $(this).closest('tr').find('.cv_id').text();


        fio = $(this).closest('tr').find('.cv-fio');
        email = $(this).closest('tr').find('.cv-email');
        phone = $(this).closest('tr').find('.cv-phone');
        sellary = $(this).closest('tr').find('.cv-sellary');
        birthdate = $(this).closest('tr').find('.cv-birthdate');
        experiance_years = $(this).closest('tr').find('.cv-experiance_years');
        experiance_places = $(this).closest('tr').find('.cv-experiance_places');
        skills = $(this).closest('tr').find('.cv-skills');
        about = $(this).closest('tr').find('.cv-about');
        comment = $(this).closest('tr').find('.cv-row-comment');
        birth = $(this).closest('tr').find('.cv-birth');

        editable_fio = $('#dataInfoEdit .cv-edit-fio .form-control');
        editable_email = $('#dataInfoEdit .cv-edit-email .form-control');
        editable_phone = $('#dataInfoEdit .cv-edit-phone .form-control');
        editable_sellary = $('#dataInfoEdit .cv-edit-sellary .form-control');
        editable_birthdate = $('#dataInfoEdit .cv-edit-birthday .form-control');
        editable_experiance_years = $('#dataInfoEdit .cv-edit-experiance-years .form-control');
        editable_experiance_places = $('#dataInfoEdit .cv-edit-experiance-place');
        editable_skills = $('#dataInfoEdit .cv-edit-skills');
        editable_about = $('#dataInfoEdit .cv-edit-about');
        editable_comment = $('#dataInfoEdit .cv-edit-comment .form-control');
        editable_birth = $('#dataInfoEdit .datepicker');
        editable_file = $('#dataInfoEdit #file');


        editable_fio.val(fio.text());
        editable_email.val(email.text());
        editable_phone.val(phone.text());
        editable_sellary.val(sellary.text());
        editable_birthdate.val(birthdate.text());
        editable_experiance_years.val(experiance_years.text());
        editable_experiance_places.val(experiance_places.text());
        editable_skills.val(skills.text());
        editable_about.val(about.text());
        editable_comment.val(comment.text());

        // make good looking date format
        var oldDate = birth.text();
        var newDate = "";
        var a = oldDate.split("-");
        for (var i = a.length - 1; i >= 0; i--) {
            var dash = "";
            if (i != 0)
                dash = ".";
            newDate += a[i] + dash;
        }
        editable_birth.val(newDate);
    });

    $('.cv-edit-save').click(function () {
        $.ajax({
            url: locationURL + '/cv/update',
            type: 'POST',
            data: {
                cvId: cvId,
                editable_fio: editable_fio.val(),
                editable_email: editable_email.val(),
                editable_phone: editable_phone.val(),
                editable_sellary: editable_sellary.val(),
                editable_birthdate: editable_birthdate.val(),
                editable_experiance_years: editable_experiance_years.val(),
                editable_experiance_places: editable_experiance_places.val(),
                editable_skills: editable_skills.val(),
                editable_about: editable_about.val(),
                editable_comment: editable_comment.val(),
                editable_birth: editable_birth.val()
            },
            success: function (response) {
                console.log("cv has been successfully updated + " + response);
                 fio.children('a').text(editable_fio.val());
                 email.text(editable_email.val());
                 phone.text(editable_phone.val());
                 sellary.text(editable_sellary.val());
                 birthdate.text(editable_birthdate.val());
                 experiance_years.text(editable_experiance_years.val());
                 experiance_places.text(editable_experiance_places.val());
                 skills.text(editable_skills.val());
                 about.text(editable_about.val());
                 comment.text(editable_comment.val());
                 birth.text(editable_birth.val());
            },
            error: function (error) {
                console.log("error! cv has not been updated : " + error);
            }
        });
    });


    $('.bookmark-cv').click(function () {
        var cvId = $(this).closest('tr').find('.cv_id').text();
        if ($(this).attr('state') == 1) { // добавить резюме в закладки

            if (locationURL.search(/bookmarks/)) {
                locationURL = locationURL.replace("bookmarks", '');
            }

            $(this).attr('src', locationURL + '/resources/img/add_new_star.png');
            $(this).attr('state', 0);

            $.ajax({
                url: locationURL + '/cv/change-bookmark-state',
                type: 'POST',
                data: {
                    cvId: cvId,
                    state: '0'
                },
                success: function (response) {
                    console.log("cv has successfully removed bookmark");
                },
                error: function (error) {
                    console.log("error! cv has not been bookmarked");
                }
            });
        } else { // удалить резюме из закладок

            if (locationURL.search(/bookmarks/)) {
                locationURL = locationURL.replace("bookmarks", '');
            }
            $(this).attr('src', locationURL + '/resources/img/star_added.png');
            $(this).attr('state', 1);

            $.ajax({
                url: locationURL + '/cv/change-bookmark-state',
                type: 'POST',
                data: {
                    cvId: cvId,
                    state: '1'
                },
                success: function (response) {
                    console.log("cv has been successfully bookmarked");
                },
                error: function (error) {
                    console.log("error! cv has not been bookmarked");
                }
            });
        }
    });


















});




