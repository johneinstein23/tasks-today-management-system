<?php helper('url'); ?>

<header class="site-header">
    <a class="brand" href="<?= site_url('/') ?>">Tasks for Today</a>
    <nav aria-label="Main navigation">
        <a href="<?= site_url('/') ?>">Welcome</a>
        <a href="<?= site_url('tasks') ?>">Task List</a>
        <a href="<?= site_url('profile') ?>">Profile</a>
        <a href="<?= site_url('about') ?>">About</a>
    </nav>
</header>
