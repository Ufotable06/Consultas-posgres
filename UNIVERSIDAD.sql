PGDMP         9                {            Universidad    15.2    15.2 5    ;           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            <           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            =           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            >           1262    41206    Universidad    DATABASE     �   CREATE DATABASE "Universidad" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE "Universidad";
                postgres    false            �            1259    41320    alumno_se_matricula_asignatura    TABLE     �   CREATE TABLE public.alumno_se_matricula_asignatura (
    id_alumno integer NOT NULL,
    id_asignatura integer NOT NULL,
    id_curso_escolar integer NOT NULL
);
 2   DROP TABLE public.alumno_se_matricula_asignatura;
       public         heap    postgres    false            �            1259    41296 
   asignatura    TABLE     �  CREATE TABLE public.asignatura (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    creditos double precision NOT NULL,
    tipo character varying(100) NOT NULL,
    curso smallint NOT NULL,
    cuatrimestre smallint NOT NULL,
    id_profesor integer,
    id_grado integer NOT NULL,
    CONSTRAINT asignatura_tipo_check CHECK (((tipo)::text = ANY (ARRAY[('básica'::character varying)::text, ('obligatoria'::character varying)::text, ('optativa'::character varying)::text])))
);
    DROP TABLE public.asignatura;
       public         heap    postgres    false            �            1259    41295    asignatura_id_seq    SEQUENCE     �   CREATE SEQUENCE public.asignatura_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.asignatura_id_seq;
       public          postgres    false    222            ?           0    0    asignatura_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.asignatura_id_seq OWNED BY public.asignatura.id;
          public          postgres    false    221            �            1259    41314    curso_escolar    TABLE     �   CREATE TABLE public.curso_escolar (
    id integer NOT NULL,
    anyo_inicio integer NOT NULL,
    anyo_fin integer NOT NULL
);
 !   DROP TABLE public.curso_escolar;
       public         heap    postgres    false            �            1259    41313    curso_escolar_id_seq    SEQUENCE     �   CREATE SEQUENCE public.curso_escolar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.curso_escolar_id_seq;
       public          postgres    false    224            @           0    0    curso_escolar_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.curso_escolar_id_seq OWNED BY public.curso_escolar.id;
          public          postgres    false    223            �            1259    41257    departamento    TABLE     i   CREATE TABLE public.departamento (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
     DROP TABLE public.departamento;
       public         heap    postgres    false            �            1259    41256    departamento_id_seq    SEQUENCE     �   CREATE SEQUENCE public.departamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.departamento_id_seq;
       public          postgres    false    215            A           0    0    departamento_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.departamento_id_seq OWNED BY public.departamento.id;
          public          postgres    false    214            �            1259    41289    grado    TABLE     c   CREATE TABLE public.grado (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);
    DROP TABLE public.grado;
       public         heap    postgres    false            �            1259    41288    grado_id_seq    SEQUENCE     �   CREATE SEQUENCE public.grado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.grado_id_seq;
       public          postgres    false    220            B           0    0    grado_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.grado_id_seq OWNED BY public.grado.id;
          public          postgres    false    219            �            1259    41264    persona    TABLE     K  CREATE TABLE public.persona (
    id integer NOT NULL,
    nif character varying(9),
    nombre character varying(25) NOT NULL,
    apellido1 character varying(50) NOT NULL,
    apellido2 character varying(50),
    ciudad character varying(25) NOT NULL,
    direccion character varying(50) NOT NULL,
    telefono character varying(9),
    fecha_nacimiento date NOT NULL,
    sexo character(1) NOT NULL,
    tipo character varying(8) NOT NULL,
    CONSTRAINT persona_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['profesor'::character varying, 'alumno'::character varying])::text[])))
);
    DROP TABLE public.persona;
       public         heap    postgres    false            �            1259    41263    persona_id_seq    SEQUENCE     �   CREATE SEQUENCE public.persona_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.persona_id_seq;
       public          postgres    false    217            C           0    0    persona_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.persona_id_seq OWNED BY public.persona.id;
          public          postgres    false    216            �            1259    41273    profesor    TABLE     i   CREATE TABLE public.profesor (
    id_profesor integer NOT NULL,
    id_departamento integer NOT NULL
);
    DROP TABLE public.profesor;
       public         heap    postgres    false            �           2604    41299    asignatura id    DEFAULT     n   ALTER TABLE ONLY public.asignatura ALTER COLUMN id SET DEFAULT nextval('public.asignatura_id_seq'::regclass);
 <   ALTER TABLE public.asignatura ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    41317    curso_escolar id    DEFAULT     t   ALTER TABLE ONLY public.curso_escolar ALTER COLUMN id SET DEFAULT nextval('public.curso_escolar_id_seq'::regclass);
 ?   ALTER TABLE public.curso_escolar ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    41260    departamento id    DEFAULT     r   ALTER TABLE ONLY public.departamento ALTER COLUMN id SET DEFAULT nextval('public.departamento_id_seq'::regclass);
 >   ALTER TABLE public.departamento ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    41292    grado id    DEFAULT     d   ALTER TABLE ONLY public.grado ALTER COLUMN id SET DEFAULT nextval('public.grado_id_seq'::regclass);
 7   ALTER TABLE public.grado ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    41267 
   persona id    DEFAULT     h   ALTER TABLE ONLY public.persona ALTER COLUMN id SET DEFAULT nextval('public.persona_id_seq'::regclass);
 9   ALTER TABLE public.persona ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            8          0    41320    alumno_se_matricula_asignatura 
   TABLE DATA           d   COPY public.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) FROM stdin;
    public          postgres    false    225   A       5          0    41296 
   asignatura 
   TABLE DATA           l   COPY public.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) FROM stdin;
    public          postgres    false    222   �A       7          0    41314    curso_escolar 
   TABLE DATA           B   COPY public.curso_escolar (id, anyo_inicio, anyo_fin) FROM stdin;
    public          postgres    false    224   �F       .          0    41257    departamento 
   TABLE DATA           2   COPY public.departamento (id, nombre) FROM stdin;
    public          postgres    false    215   )G       3          0    41289    grado 
   TABLE DATA           +   COPY public.grado (id, nombre) FROM stdin;
    public          postgres    false    220   �G       0          0    41264    persona 
   TABLE DATA           �   COPY public.persona (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) FROM stdin;
    public          postgres    false    217   �H       1          0    41273    profesor 
   TABLE DATA           @   COPY public.profesor (id_profesor, id_departamento) FROM stdin;
    public          postgres    false    218   �L       D           0    0    asignatura_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.asignatura_id_seq', 1, false);
          public          postgres    false    221            E           0    0    curso_escolar_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.curso_escolar_id_seq', 1, false);
          public          postgres    false    223            F           0    0    departamento_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.departamento_id_seq', 1, false);
          public          postgres    false    214            G           0    0    grado_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.grado_id_seq', 1, false);
          public          postgres    false    219            H           0    0    persona_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.persona_id_seq', 1, false);
          public          postgres    false    216            �           2606    41324 B   alumno_se_matricula_asignatura alumno_se_matricula_asignatura_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_pkey PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar);
 l   ALTER TABLE ONLY public.alumno_se_matricula_asignatura DROP CONSTRAINT alumno_se_matricula_asignatura_pkey;
       public            postgres    false    225    225    225            �           2606    41302    asignatura asignatura_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.asignatura DROP CONSTRAINT asignatura_pkey;
       public            postgres    false    222            �           2606    41319     curso_escolar curso_escolar_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.curso_escolar
    ADD CONSTRAINT curso_escolar_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.curso_escolar DROP CONSTRAINT curso_escolar_pkey;
       public            postgres    false    224            �           2606    41262    departamento departamento_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.departamento DROP CONSTRAINT departamento_pkey;
       public            postgres    false    215            �           2606    41294    grado grado_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.grado
    ADD CONSTRAINT grado_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.grado DROP CONSTRAINT grado_pkey;
       public            postgres    false    220            �           2606    41272    persona persona_nif_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_nif_key UNIQUE (nif);
 A   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_nif_key;
       public            postgres    false    217            �           2606    41270    persona persona_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public            postgres    false    217            �           2606    41277    profesor profesor_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_pkey PRIMARY KEY (id_profesor);
 @   ALTER TABLE ONLY public.profesor DROP CONSTRAINT profesor_pkey;
       public            postgres    false    218            �           2606    41325 L   alumno_se_matricula_asignatura alumno_se_matricula_asignatura_id_alumno_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_id_alumno_fkey FOREIGN KEY (id_alumno) REFERENCES public.persona(id);
 v   ALTER TABLE ONLY public.alumno_se_matricula_asignatura DROP CONSTRAINT alumno_se_matricula_asignatura_id_alumno_fkey;
       public          postgres    false    217    225    3213            �           2606    41330 P   alumno_se_matricula_asignatura alumno_se_matricula_asignatura_id_asignatura_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_id_asignatura_fkey FOREIGN KEY (id_asignatura) REFERENCES public.asignatura(id);
 z   ALTER TABLE ONLY public.alumno_se_matricula_asignatura DROP CONSTRAINT alumno_se_matricula_asignatura_id_asignatura_fkey;
       public          postgres    false    3219    225    222            �           2606    41335 S   alumno_se_matricula_asignatura alumno_se_matricula_asignatura_id_curso_escolar_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_id_curso_escolar_fkey FOREIGN KEY (id_curso_escolar) REFERENCES public.curso_escolar(id);
 }   ALTER TABLE ONLY public.alumno_se_matricula_asignatura DROP CONSTRAINT alumno_se_matricula_asignatura_id_curso_escolar_fkey;
       public          postgres    false    3221    225    224            �           2606    41308 #   asignatura asignatura_id_grado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_id_grado_fkey FOREIGN KEY (id_grado) REFERENCES public.grado(id);
 M   ALTER TABLE ONLY public.asignatura DROP CONSTRAINT asignatura_id_grado_fkey;
       public          postgres    false    220    3217    222            �           2606    41303 &   asignatura asignatura_id_profesor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_id_profesor_fkey FOREIGN KEY (id_profesor) REFERENCES public.profesor(id_profesor);
 P   ALTER TABLE ONLY public.asignatura DROP CONSTRAINT asignatura_id_profesor_fkey;
       public          postgres    false    218    3215    222            �           2606    41283 &   profesor profesor_id_departamento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES public.departamento(id);
 P   ALTER TABLE ONLY public.profesor DROP CONSTRAINT profesor_id_departamento_fkey;
       public          postgres    false    3209    215    218            �           2606    41278 "   profesor profesor_id_profesor_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_id_profesor_fkey FOREIGN KEY (id_profesor) REFERENCES public.persona(id);
 L   ALTER TABLE ONLY public.profesor DROP CONSTRAINT profesor_id_profesor_fkey;
       public          postgres    false    217    218    3213            8   b   x�-��� �7�>���_G�7�t��fͺ5��s���k�Z���MN#q����v�"#2"#2"#2"#2"#2�+sp�������{��?[�#/      5   N  x��WKr�8\ç�	R"EI�ұ�W����U6	qPE
:���(^z�Ŕ�����T\�Xd���6C���g,�4�y�h<U�h�Oh��*�LQ�&���#�oIⳈ\6�yR�b�2��vI��W�(8P��^�֨�VLnJ%EZ'	o�� ހ(�*�y�;cE�Ȍ�������U������*Zy�[�O��)��Y���u�j8�(��"Y�J��D����sr]�)-X�De\�Y�$��9mK�j�2����晐ͫ*�Xm;\�[�D���d��\��5G &$�.�ADm�¨�௨��)��rU��xb���$�q��g�JΤ�1�^���y���<�
�Ga�T��x�=a������?
�_���b�1�A�.E�w<�ر'E�g�=q��1݄�%w9:y�\/����;)�P9�A7H�x��hA���-<0����h#�Br���R��T�:�=Ml4uUS�ň�t���Q��]�m��A�RY·Ϛ�{Ei:����_����&���0VX' �d3��V�Q d��W��_z2����s�1\�����&,�%Oi�#��8���R�����ܸ6�14����� _?�Ώ�'\a��-�i�D����;/u� i�Kx۫��MUJ'��ZbH�d���A�a�͋�ʆ</SS���{���p��[K�]��ʹ�:V��(������O\��,�]���&wL�}�"�p���6����D q���.�&�-p�J��9��+m���ҭUU@Bg\���"�$>��Z��Y�]�Ÿ�r�E��n2"ל�x��`_<�9��9�W�+���Y� j$�SR��Ug�de�c��e(��,��_���$T��0�&�Z���
����7��I��@%E�礟B��%u�uj\����]a���x�'ܦ��/~�x_�#?;����p���#��j����uN�hels�:n�޷�nm����"�ͫ��=:����`Bf��dmt�M���#˘2J�)F���p�	�[�^�u/!�3�׋Q�7^THnyEv�yAȻP6��f(n"r�Y�,�����E�]A!��mY����r�R�g�1ò)�hvqO�;бj�,�7c
(���vhq�n���¦��Sێ������o�u�U��?\����1�F���qT#W���j�IZ#Ê�]=����	(e�oi�������o�Ӽhƙ���R�IV5�bz;�^.n<s�q1k��kl='�ސ��4��K��?!h��ۑ9�6�1���b]Q��&�B�=o��Tb/k�Y4Y�5v��OdG�D��Â3��Nu��Νfn�ɧO�Y��>��'��D\�>�����M�D      7   0   x�3�4204�\F`
D�q�)a��6\`ia����� P�
      .   �   x�3���K�/�=��$39�ˈ�7�$�+�2�tM����=�6Q�R�5��(�8�˄�5�4919���<.SN��"�.3����ks�z����-�i�閙����Ra��Z�����e��	*vO������� ��7E      3   �   x�}ϱ�0��>EGY ��h�a �ݥ��4)��1:0�}1Kb($����_��ԬP�fX
�M�hZڇ+���*��b����,͋�Z���<����b���gX���2颾G��h�OUW�ӳU�X��s����w��֚���i�bG�4pTR�Cr����I r��V��LB3Z?�H�l�4|kf[ߡ��t�}C� �v�n      0   H  x�uU�r�6]_�~@-�$�t��K�r�I&��-$���S�o��"��Տ��VlQ��hF3�xpp��2�ȸ���z��i��Z�K�D��o_�����wKG�����FW�nm�>�l�*Tƕ4"'Vl��17tF��Vu8�d
%�dŜ�v��A �q�v�<s�� I����uB�����&�1�)��>GWv�ɉۃ��u=�b�E�b�hÝkB<��r����-b�3WU.ҥ��� �i#���]wo����,��,gꕞ"�N�F_ӱ}���˕_�t�%�w!o\�5�s���LqY�8��rԔI.���{z��7:MC��=���׾ŏ�!Udi�=�99W�i}No��u��_�u��bn��n�vuH7���\��ʡ�(4�����ז�n��t-�|�b 8�m�u�{+�_<O�p�+NA��U�Γ̛5ԉOឮ�[�V�q �.�ʵPL�"��c��Y��x
�E�"�K|O�g�`���tj��P�ه1��O�y�@��c�����/m��Г���F�/\=q�s���Q�1�/:�q��$����|�!h��B�[������Q9Żw�- �[8�[�,@���?���Vw��ǔqS��l�y����I�U�<WlB3(Q!K�fU��On(�q��sm�bm��| ��d����^w�l�z�)��UpC�����*�'X�%*�LP��4*��9�m��9�v	�G�n����1̽�Ѣ�FUhF�����5��6�?�ȡҊ�:�I�S��������n�#q�d�5�"���Wh�.\!0d_"���v	��:�<�L�Z���\+	 V'��aa
5�����+�����Fq�K� LO��6u�V\
�m�"�b�����s&31�SĳtMi{�`q`��o��#��<D����1}Ɋ�ې鼀!U��^*���XWiL7?�{kk
�	��c��㟌9I&�Ev�b���|�ﻴe`ܘ��~doC��M��:�f[���/H�\	�&�����p@O;'�q�`��Pj6#��|n��;�3k�O1�PG74oۯī�?�b���0��~i�T�������c�      1   5   x�ɹ  �XW�l�b�p�ɦ�Tp��k�(R�����G��o��#     