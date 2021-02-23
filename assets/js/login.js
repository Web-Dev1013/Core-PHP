    $(function () {
        $("#login").on("click", function () {
            if ($("#username").val() != "" && $("#password").val() != "") {
                var username = $("#username").val();
                var password = $("#password").val();
                $.ajax({
                    url: "model/auth/auth_model.php",
                    type: "POST",
                    data: {
                        type: "login",
                        username: username,
                        password: password
                    },
                    success: function (res) {
                        if (res == "success") {
                            $(".alert-success").removeClass("d-none");
                            $(".alert-success").addClass("show");
                            setTimeout(function () {
                                $(".alert-success").addClass("d-none");
                                $(".alert-success").removeClass("show");
                            }, 2000);
                            window.location.href = "index.php";
                        }
                    }
                });
            }
        });
    })