        </div> <!-- FIM CONTAINER  -->
    </div> <!-- FIM CONTAINER-FUID -->
</body>
    <script type="text/javascript" src="<?= base_url('assets/js/jquery.min.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/jquery-ui.min.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/bootstrap.min.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/icons_fontawesome.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/alerts.toastr.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/datepicker.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/datetimepicker.js');?>"></script>	
    <script type="text/javascript" src="<?= base_url('assets/js/mask.jquery.min.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/mask.js')?>"></script>
    <script type="text/javascript" src="<?= base_url('assets/js/datatables.js')?>"></script>
    <script>
        $(document).ready(function() {
            //DATETIME
            $(".datetimepicker").datetimepicker({
                timepicker:true,
                step:5,
                format:'d/m/Y H:i',
                formatDate:'d/m/Y H:i'		
            });
            
            $(".datepicker-dmy").datetimepicker({
                timepicker:false,
                step:5,
                format:'d/m/Y',
                formatDate:'d/m/Y',
                scrollMonth : false,
                scrollInput : false,
                monthNames: ['Janeiro','Fevereiro','Mar&cecedil;o','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
            });
            
            $('body').on('click','.datepicker-dmy-dynamic',function(){
                $(this).datetimepicker({
                    timepicker:false,
                    step:5,
                    format:'d/m/Y',
                    formatDate:'d/m/Y',
                    monthNames: ['Janeiro','Fevereiro','Mar&cecedil;o','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
                });
            });
            
            $(".datepicker-my").datepicker({
                dateFormat: "mm/yy",						
                dayNamesMin: [ "Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab" ],
                dayNames: [ 'Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado' ],
                monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
                showOptions: { direction: "up" },
                showAnim: "puff",
                duration: 300,
            }); 
                
            $(".datepicker").datepicker({
                    dateFormat: "dd/mm/yy",									
                    dayNamesMin: [ "Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab" ],
                    dayNames: [ "Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado" ],
                    monthNames: ["Janeiro","Fevereiro","Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"],
                    showOptions: { direction: "up" },
                    showAnim: "puff",
                    duration: 300,
            });	
    
            //DATATEBLE
            $(".datatable").dataTable({
                "bJQueryUI": false,
                "sPaginationType": "full_numbers",
                "sDom": '<"H"Tlfr>t<"F"ip>',
                "oLanguage": {
                    "sLengthMenu": "Mostrar _MENU_ registros por página",
                    "sZeroRecords": "Nenhum registro encontrado",
                    "sInfo": "Mostrando _START_ / _END_ de _TOTAL_ registro(s)",
                    "sInfoEmpty": "Mostrando 0 / 0 de 0 registros",
                    "sInfoFiltered": "(filtrado de _MAX_ registros)",
                    "sSearch": "Pesquisar: ",
                    "oPaginate": {
                        "sFirst": "Início",
                        "sPrevious": "Anterior",
                        "sNext": "Próximo",
                        "sLast": "Último"
                    }
                },
                "order": [],
                "lengthMenu":[[5,30,100,-1],[5,30,100,'Todos']],
                "bPaginate":true,	
                "aaSorting": [[0, 'desc']],
                "aoColumnDefs": [
                    {"sType": "num-html", "aTargets": [0]},
                    { "bSortable": false, "aTargets": [3] }
                ]
            });

            $('#showPassword').on('click', function(){
                var passwordField = $('#password');
                var passwordFieldType = passwordField.attr('type');

                if (passwordFieldType == 'password') {
                    passwordField.attr('type', 'text');
                    $(this).html('<i class="far fa-eye-slash"></i>');
                } else {
                    passwordField.attr('type', 'password');
                    $(this).html('<i class="far fa-eye"></i>');
                }
            });

            $('button').tooltip();
        });
    </script>
</html>