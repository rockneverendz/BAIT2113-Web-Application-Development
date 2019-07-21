<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArtGallery.aspx.cs" Inherits="BAIT2113_Web_Application_Development.ArtGallery" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css" />
    <title>Art Gallery</title>
    <style>
        /* Globals */
        /* Links */
        a,
        a:focus,
        a:hover {
            color: #fff;
        }

        /* Custom default button */
        .btn-secondary,
        .btn-secondary:hover,
        .btn-secondary:focus {
            color: #333;
            text-shadow: none; /* Prevent inheritance from `body` */
            background-color: #fff;
            border: .05rem solid #fff;
        }

        /* Base structure */
        html,
        body {
            height: 100%;
            background-color: #333;
        }

        body {
            display: -ms-flexbox;
            display: flex;
            color: #fff;
            background-image: url('resource/gallery_exhibition.jpg');
            background-repeat: no-repeat;
            background-size: 100% auto;
            background-position: center;
            text-shadow: 0 .05rem .1rem rgba(0, 0, 0, .5);
            box-shadow: inset 0 0 5rem rgba(0, 0, 0, .5);
        }

        .cover-container {
            max-width: 42em;
        }

        /* Header */
        .masthead {
            margin-bottom: 2rem;
        }

        .masthead-brand {
            margin-bottom: 0;
        }

        .nav-masthead .nav-link {
            padding: .25rem 0;
            font-weight: 700;
            color: rgba(255, 255, 255, .5);
            background-color: transparent;
            border-bottom: .25rem solid transparent;
        }

            .nav-masthead .nav-link:hover,
            .nav-masthead .nav-link:focus {
                border-bottom-color: rgba(255, 255, 255, .25);
            }

            .nav-masthead .nav-link + .nav-link {
                margin-left: 1rem;
            }

        .nav-masthead .active {
            color: #fff;
            border-bottom-color: #fff;
        }

        @media (min-width: 48em) {
            .masthead-brand {
                float: left;
            }

            .nav-masthead {
                float: right;
            }
        }


        /* Cover */
        .cover {
            padding: 0 1.5rem;
        }

            .cover .btn-lg {
                padding: .75rem 1.25rem;
                font-weight: 700;
            }


        /* Footer */
        .mastfoot {
            color: rgba(255, 255, 255, .5);
        }
    </style>
</head>
<body class="text-center">
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
        <header class="masthead mb-auto">
            <div class="inner">
                <h3 class="masthead-brand">ArtGallery</h3>
                <nav class="nav nav-masthead justify-content-center">
                    <a class="nav-link active" href="#">Home</a>
                    <a class="nav-link" href="artist/account/loginArtist.aspx">Artist</a>
                    <a class="nav-link" href="customer/account/signin.aspx">Member</a>
                </nav>
            </div>
        </header>

        <main role="main" class="inner cover">
            <h3 class="cover-heading">This world is but a canvas to our imagination.</h3>
            <p class="lead">View and support millions of artists all over the world.</p>
            <p class="lead">
                <a href="customer/account/signin.aspx" class="btn btn-primary">Sign In</a>
                <a href="customer/account/signup.aspx" class="btn btn-secondary">Create Account</a>
            </p>
        </main>

        <footer class="mastfoot mt-auto">
            <div class="inner">
                <p>Bricks © 2019</p>
            </div>
        </footer>
    </div>
</body>
</html>
