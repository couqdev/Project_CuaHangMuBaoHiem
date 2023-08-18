<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section style="background-color: #f7f6f6;">
    <div class="container my-5 py-5 text-dark">
        <div class="row d-flex justify-content-center">
            <div class="col-md-12 col-lg-10 col-xl-8">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h4 class="text-dark mb-0">Unread comments (4)</h4>
                    <div class="card">

                    </div>
                </div>

                <c:forEach items="${listComt}" var="c">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="d-flex flex-start">
                                <img class="rounded-circle shadow-1-strong me-3"
                                     src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(26).webp" alt="avatar" width="40"
                                     height="40" />
                                <div class="w-100">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h6 class="text-primary fw-bold mb-0">
                                            ${c.id_customer}
                                            <span class="text-dark ms-2">${c.content}</span>
                                        </h6>
                                        <p class="mb-0">2 days ago</p>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <p class="small mb-0" style="color: #aaa;">
                                            <a href="#!" class="link-grey">Remove</a> •
                                            <a href="#!" class="link-grey">Reply</a> •
                                            <a href="#!" class="link-grey">Translate</a>
                                        </p>
                                        <div class="d-flex flex-row">
                                            <i class="fas fa-star text-warning me-2"></i>
                                            <i class="far fa-check-circle" style="color: #aaa;"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>


                <div class="card mb-3">
                    <div class="card-body">
                        <div class="d-flex flex-start">
                            <img class="rounded-circle shadow-1-strong me-3"
                                 src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(21).webp" alt="avatar" width="40"
                                 height="40" />
                            <div class="w-100">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h6 class="text-primary fw-bold mb-0">
                                        the_sylvester_cat
                                        <span class="text-dark ms-2">Loving your work and profile! </span>
                                    </h6>
                                    <p class="mb-0">3 days ago</p>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <p class="small mb-0" style="color: #aaa;">
                                        <a href="#!" class="link-grey">Remove</a> •
                                        <a href="#!" class="link-grey">Reply</a> •
                                        <a href="#!" class="link-grey">Translate</a>
                                    </p>
                                    <div class="d-flex flex-row">
                                        <i class="far fa-check-circle text-primary"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mb-3">
                    <div class="card-body">
                        <div class="d-flex flex-start">
                            <img class="rounded-circle shadow-1-strong me-3"
                                 src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(20).webp" alt="avatar" width="40"
                                 height="40" />
                            <div class="w-100">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h6 class="text-primary fw-bold mb-0">
                                        mindyy_def
                                        <span class="text-dark ms-2">Really cool Which filter are you using?
                                                                        </span>
                                    </h6>
                                    <p class="mb-0">3 days ago</p>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <p class="small mb-0" style="color: #aaa;">
                                        <a href="#!" class="link-grey">Remove</a> •
                                        <a href="#!" class="link-grey">Reply</a> •
                                        <a href="#!" class="link-grey">Translate</a>
                                    </p>
                                    <div class="d-flex flex-row">
                                        <i class="fas fa-user-plus" style="color: #aaa;"></i>
                                        <i class="far fa-star mx-2" style="color: #aaa;"></i>
                                        <i class="far fa-check-circle text-primary"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mb-3">
                    <div class="card-body">
                        <div class="d-flex flex-start">
                            <img class="rounded-circle shadow-1-strong me-3"
                                 src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(14).webp" alt="avatar" width="40"
                                 height="40" />
                            <div class="w-100">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h6 class="text-primary fw-bold mb-0">
                                        t_anya
                                        <span class="text-dark ms-2"><span class="text-primary">@macky_lones</span>
                                                                        <span class="text-primary">@rashida_jones</span> Thanks
                                                                        </span>
                                    </h6>
                                    <p class="mb-0">4 days ago</p>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <p class="small mb-0" style="color: #aaa;">
                                        <a href="#!" class="link-grey">Remove</a> •
                                        <a href="#!" class="link-grey">Reply</a> •
                                        <a href="#!" class="link-grey">Translate</a>F
                                    </p>
                                    <div class="d-flex flex-row">
                                        <i class="far fa-check-circle text-primary"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
