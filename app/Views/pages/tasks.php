<?= $this->include('partials/head', ['title' => 'Task List | Tasks for Today']) ?>

<section class="page-heading">
    <p class="eyebrow">ALL RECORDS</p>
    <h1>Task List</h1>
    <p class="muted">Every task, ordered by scheduled date.</p>
</section>

<?php if ($tasks === []): ?>
    <section class="empty-state"><h2>No tasks found</h2></section>
<?php else: ?>
    <div class="table-wrap">
        <table>
            <thead>
                <tr><th>ID</th><th>Task</th><th>Status</th><th>Task date</th><th>Created at</th></tr>
            </thead>
            <tbody>
                <?php foreach ($tasks as $task): ?>
                    <tr>
                        <td><?= esc($task['id']) ?></td>
                        <td class="task-title-cell"><?= esc($task['title']) ?></td>
                        <td><span class="status status-<?= esc(url_title($task['status'], '-', true)) ?>"><?= esc(ucwords(str_replace('_', ' ', $task['status']))) ?></span></td>
                        <td><?= esc(date('M j, Y', strtotime($task['task_date']))) ?></td>
                        <td><?= esc(date('M j, Y g:i A', strtotime($task['created_at']))) ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
<?php endif; ?>

<?= $this->include('partials/foot') ?>
