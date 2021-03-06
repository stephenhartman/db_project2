USE [Project2]
GO
/****** Object:  Table [dbo].[ACTOR]    Script Date: 12/2/2017 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTOR](
	[ACTOR_ID] [int] IDENTITY(1,1) NOT NULL,
	[ACTOR_FIRST_NAME] [varchar](500) NOT NULL,
	[ACTOR_LAST_NAME] [varchar](500) NOT NULL,
	[ACTOR_BIRTH_DATE] [datetime] NULL,
 CONSTRAINT [PK_ACTOR] PRIMARY KEY CLUSTERED 
(
	[ACTOR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CERTIFICATION]    Script Date: 12/2/2017 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CERTIFICATION](
	[CERTIFICATION_ID] [int] IDENTITY(1,1) NOT NULL,
	[CERTIFICATION_NAME] [varchar](500) NOT NULL,
	[CERTIFICATION_DESC] [varchar](max) NOT NULL,
 CONSTRAINT [PK_CERTIFICATION] PRIMARY KEY CLUSTERED 
(
	[CERTIFICATION_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FILM]    Script Date: 12/2/2017 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FILM](
	[FILM_ID] [int] IDENTITY(1,1) NOT NULL,
	[FILM_NAME] [varchar](500) NOT NULL,
	[FILM_DESC] [varchar](max) NOT NULL,
	[FILM_RELEASE_DATE] [datetime] NOT NULL,
	[CERTIFICATION_ID] [int] NOT NULL,
	[FILM_GENRE_ID] [int] NOT NULL,
	[FILM_GROSS_SALES] [int] NOT NULL,
	[FILM_BUDGET] [int] NOT NULL,
 CONSTRAINT [PK_FILM] PRIMARY KEY CLUSTERED 
(
	[FILM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FILM_2_PRODUCER]    Script Date: 12/2/2017 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FILM_2_PRODUCER](
	[FILM_2_PRODUCER_ID] [int] IDENTITY(1,1) NOT NULL,
	[FILM_ID] [int] NOT NULL,
	[PRODUCER_ID] [int] NOT NULL,
 CONSTRAINT [PK_FILM_2_PRODUCER] PRIMARY KEY CLUSTERED 
(
	[FILM_2_PRODUCER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FILM_GENRE]    Script Date: 12/2/2017 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FILM_GENRE](
	[FILM_GENRE_ID] [int] IDENTITY(1,1) NOT NULL,
	[FILM_GENRE_NAME] [varchar](500) NOT NULL,
	[FILM_GENRE_DESC] [varchar](max) NOT NULL,
 CONSTRAINT [PK_FILM_GENRE] PRIMARY KEY CLUSTERED 
(
	[FILM_GENRE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCER]    Script Date: 12/2/2017 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCER](
	[PRODUCER_ID] [int] IDENTITY(1,1) NOT NULL,
	[PRODUCER_FIRST_NAME] [varchar](500) NOT NULL,
	[PRODUCER_LAST_NAME] [varchar](500) NOT NULL,
	[PRODUCER_BIRTH_DATE] [datetime] NULL,
 CONSTRAINT [PK_PRODUCER] PRIMARY KEY CLUSTERED 
(
	[PRODUCER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROLE]    Script Date: 12/2/2017 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLE](
	[ROLE_ID] [int] IDENTITY(1,1) NOT NULL,
	[FILM_ID] [int] NOT NULL,
	[ACTOR_ID] [int] NOT NULL,
	[ROLE_NAME] [varchar](500) NOT NULL,
	[ROLE_DESC] [varchar](max) NOT NULL,
	[ROLE_FAMOUS_QUOTE] [varchar](max) NULL,
 CONSTRAINT [PK_ROLE] PRIMARY KEY CLUSTERED 
(
	[ROLE_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[FILM]  WITH CHECK ADD  CONSTRAINT [FK_FILM_CERTIFICATION] FOREIGN KEY([CERTIFICATION_ID])
REFERENCES [dbo].[CERTIFICATION] ([CERTIFICATION_ID])
GO
ALTER TABLE [dbo].[FILM] CHECK CONSTRAINT [FK_FILM_CERTIFICATION]
GO
ALTER TABLE [dbo].[FILM]  WITH CHECK ADD  CONSTRAINT [FK_FILM_FILM_GENRE] FOREIGN KEY([FILM_GENRE_ID])
REFERENCES [dbo].[FILM_GENRE] ([FILM_GENRE_ID])
GO
ALTER TABLE [dbo].[FILM] CHECK CONSTRAINT [FK_FILM_FILM_GENRE]
GO
ALTER TABLE [dbo].[FILM_2_PRODUCER]  WITH CHECK ADD  CONSTRAINT [FK_FILM_2_PRODUCER_FILM] FOREIGN KEY([FILM_ID])
REFERENCES [dbo].[FILM] ([FILM_ID])
GO
ALTER TABLE [dbo].[FILM_2_PRODUCER] CHECK CONSTRAINT [FK_FILM_2_PRODUCER_FILM]
GO
ALTER TABLE [dbo].[FILM_2_PRODUCER]  WITH CHECK ADD  CONSTRAINT [FK_FILM_2_PRODUCER_PRODUCER] FOREIGN KEY([PRODUCER_ID])
REFERENCES [dbo].[PRODUCER] ([PRODUCER_ID])
GO
ALTER TABLE [dbo].[FILM_2_PRODUCER] CHECK CONSTRAINT [FK_FILM_2_PRODUCER_PRODUCER]
GO
ALTER TABLE [dbo].[ROLE]  WITH CHECK ADD  CONSTRAINT [FK_ROLE_ACTOR] FOREIGN KEY([ACTOR_ID])
REFERENCES [dbo].[ACTOR] ([ACTOR_ID])
GO
ALTER TABLE [dbo].[ROLE] CHECK CONSTRAINT [FK_ROLE_ACTOR]
GO
ALTER TABLE [dbo].[ROLE]  WITH CHECK ADD  CONSTRAINT [FK_ROLE_FILM] FOREIGN KEY([FILM_ID])
REFERENCES [dbo].[FILM] ([FILM_ID])
GO
ALTER TABLE [dbo].[ROLE] CHECK CONSTRAINT [FK_ROLE_FILM]
GO
/****** Object:  StoredProcedure [dbo].[ACTORPRODUCER3]    Script Date: 12/2/2017 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[ACTORPRODUCER3]
    @numfilms int
AS
BEGIN
    select p.PRODUCER_FIRST_NAME, p.PRODUCER_LAST_NAME, p.PRODUCER_ID, a.ACTOR_ID, Count(*) as [# of Movies]
    from PRODUCER p
    inner join FILM_2_PRODUCER fp
    on p.PRODUCER_ID = fp.PRODUCER_ID 
    inner join FILM f
    on f.FILM_ID = fp.FILM_ID
    inner join ROLE r
    on r.FILM_ID = f.FILM_ID
    inner join ACTOR a
    on a.ACTOR_ID = r.ACTOR_ID 
    where 
        a.ACTOR_FIRST_NAME = p.PRODUCER_FIRST_NAME AND p.PRODUCER_LAST_NAME = a.ACTOR_LAST_NAME 
    group by p.PRODUCER_FIRST_NAME, p.PRODUCER_LAST_NAME, p.PRODUCER_ID, a.ACTOR_ID
    having  count(*) > (@numfilms -1)
END
GO
/****** Object:  StoredProcedure [dbo].[FAMOUS_QUOTE_BY_BUDGET]    Script Date: 12/2/2017 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stephen Hartman
-- Create date: 11/27/17
-- Description:	Stored Procedure to get famous quotes sorted by highest film budget grouped by blocks of budgets.
-- =============================================
CREATE PROCEDURE [dbo].[FAMOUS_QUOTE_BY_BUDGET]
	@budget_low int,
	@budget_high int,
	@sort int
AS
BEGIN
	SET NOCOUNT ON;
if @sort = 0
	select 
		FILM_NAME as [Film Name], 
		'$' + Format(FILM_BUDGET, '#,0') as [Film Budget], 
		ROLE_NAME as [Role Name], 
		ROLE_FAMOUS_QUOTE as [Role Famous Quote],
		a.ACTOR_FIRST_NAME + ' ' + a.ACTOR_LAST_NAME as Actor, 
		datediff(year, a.ACTOR_BIRTH_DATE, f.FILM_RELEASE_DATE) as [Actor Age]
	from 
		ROLE r
	inner join 
		FILM f
	on 
		r.FILM_ID = f.FILM_ID
	inner join 
		ACTOR a
	on 
		r.ACTOR_ID = a.ACTOR_ID
	where 
		f.FILM_BUDGET >= @budget_low and f.FILM_BUDGET <= @budget_high 
	group by 
		FILM_NAME, FILM_BUDGET, ROLE_NAME, ROLE_FAMOUS_QUOTE, a.ACTOR_FIRST_NAME + ' ' + a.ACTOR_LAST_NAME, datediff(year, a.ACTOR_BIRTH_DATE, f.FILM_RELEASE_DATE)
	order by 
		FILM_BUDGET asc
else if @sort = 1
	select 
		FILM_NAME as [Film Name], 
		'$' + Format(FILM_BUDGET, '#,0') as [Film Budget], 
		ROLE_NAME as [Role Name], 
		ROLE_FAMOUS_QUOTE as [Role Famous Quote],
		a.ACTOR_FIRST_NAME + ' ' + a.ACTOR_LAST_NAME as Actor, 
		datediff(year, a.ACTOR_BIRTH_DATE, f.FILM_RELEASE_DATE) as [Actor Age]
	from 
		ROLE r
	inner join 
		FILM f
	on 
		r.FILM_ID = f.FILM_ID
	inner join 
		ACTOR a
	on 
		r.ACTOR_ID = a.ACTOR_ID
	where 
		f.FILM_BUDGET >= @budget_low and f.FILM_BUDGET <= @budget_high 
	group by 
		FILM_NAME, FILM_BUDGET, ROLE_NAME, ROLE_FAMOUS_QUOTE, a.ACTOR_FIRST_NAME + ' ' + a.ACTOR_LAST_NAME, datediff(year, a.ACTOR_BIRTH_DATE, f.FILM_RELEASE_DATE)
	order by 
		FILM_BUDGET desc
else if @sort = 2
	select 
		FILM_NAME as [Film Name], 
		'$' + Format(FILM_BUDGET, '#,0') as [Film Budget], 
		ROLE_NAME as [Role Name], 
		ROLE_FAMOUS_QUOTE as [Role Famous Quote],
		a.ACTOR_FIRST_NAME + ' ' + a.ACTOR_LAST_NAME as Actor, 
		datediff(year, a.ACTOR_BIRTH_DATE, f.FILM_RELEASE_DATE) as [Actor Age]
	from 
		ROLE r
	inner join 
		FILM f
	on 
		r.FILM_ID = f.FILM_ID
	inner join 
		ACTOR a
	on 
		r.ACTOR_ID = a.ACTOR_ID
	where 
		f.FILM_BUDGET >= @budget_low and f.FILM_BUDGET <= @budget_high 
	group by 
		FILM_NAME, FILM_BUDGET, ROLE_NAME, ROLE_FAMOUS_QUOTE, a.ACTOR_FIRST_NAME + ' ' + a.ACTOR_LAST_NAME, datediff(year, a.ACTOR_BIRTH_DATE, f.FILM_RELEASE_DATE)
	order by 
		[Actor Age] asc
else if @sort = 3
	select 
		FILM_NAME as [Film Name], 
		'$' + Format(FILM_BUDGET, '#,0') as [Film Budget], 
		ROLE_NAME as [Role Name], 
		ROLE_FAMOUS_QUOTE as [Role Famous Quote],
		a.ACTOR_FIRST_NAME + ' ' + a.ACTOR_LAST_NAME as Actor, 
		datediff(year, a.ACTOR_BIRTH_DATE, f.FILM_RELEASE_DATE) as [Actor Age]
	from 
		ROLE r
	inner join 
		FILM f
	on 
		r.FILM_ID = f.FILM_ID
	inner join 
		ACTOR a
	on 
		r.ACTOR_ID = a.ACTOR_ID
	where 
		f.FILM_BUDGET >= @budget_low and f.FILM_BUDGET <= @budget_high 
	group by 
		FILM_NAME, FILM_BUDGET, ROLE_NAME, ROLE_FAMOUS_QUOTE, a.ACTOR_FIRST_NAME + ' ' + a.ACTOR_LAST_NAME, datediff(year, a.ACTOR_BIRTH_DATE, f.FILM_RELEASE_DATE)
	order by 
		[Actor Age] desc
END
GO
/****** Object:  StoredProcedure [dbo].[GROSS_BY_DAY_OF_WEEK]    Script Date: 12/2/2017 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Stephen Hartman
-- Create date: 11/27/17
-- Description:	Stored Procedure to get famous quotes sorted by highest film budget grouped by blocks of budgets.
-- =============================================
CREATE PROCEDURE [dbo].[GROSS_BY_DAY_OF_WEEK]
	@day int,
	@sort int
AS
BEGIN
	SET NOCOUNT ON;
if @sort = 0 and @day = 0
	select 
		FILM_NAME as [Film Name], 
		'$' + Format(FILM_GROSS_SALES, '#,0') as [Film Gross Sales], 
		c.CERTIFICATION_NAME,
		datename(weekday, f.FILM_RELEASE_DATE) as [Day of Release]
	from 
		FILM f
	inner join 
		CERTIFICATION c
	on 
		f.CERTIFICATION_ID = c.CERTIFICATION_ID
	group by 
		FILM_NAME, FILM_GROSS_SALES, CERTIFICATION_NAME, datename(weekday, f.FILM_RELEASE_DATE)
	order by 
		FILM_GROSS_SALES desc
else if @sort = 1 and @day = 0
	select 
		FILM_NAME as [Film Name], 
		'$' + Format(FILM_GROSS_SALES, '#,0') as [Film Gross Sales], 
		c.CERTIFICATION_NAME,
		datename(weekday, f.FILM_RELEASE_DATE) as [Day of Release]
	from 
		FILM f
	inner join 
		CERTIFICATION c
	on 
		f.CERTIFICATION_ID = c.CERTIFICATION_ID
	group by 
		FILM_NAME, FILM_GROSS_SALES, CERTIFICATION_NAME, datename(weekday, f.FILM_RELEASE_DATE)
	order by 
		FILM_GROSS_SALES asc
else if @sort = 2 and @day = 0
	select 
		FILM_NAME as [Film Name], 
		'$' + Format(FILM_GROSS_SALES, '#,0') as [Film Gross Sales], 
		c.CERTIFICATION_NAME,
		datename(weekday, f.FILM_RELEASE_DATE) as [Day of Release]
	from 
		FILM f
	inner join 
		CERTIFICATION c
	on 
		f.CERTIFICATION_ID = c.CERTIFICATION_ID
	group by 
		FILM_NAME, FILM_GROSS_SALES, CERTIFICATION_NAME, datename(weekday, f.FILM_RELEASE_DATE)
	order by 
		[Day of Release] asc
else if @sort = 3 and @day = 0
	select 
		FILM_NAME as [Film Name], 
		'$' + Format(FILM_GROSS_SALES, '#,0') as [Film Gross Sales], 
		c.CERTIFICATION_NAME,
		datename(weekday, f.FILM_RELEASE_DATE) as [Day of Release]
	from 
		FILM f
	inner join 
		CERTIFICATION c
	on 
		f.CERTIFICATION_ID = c.CERTIFICATION_ID
	group by 
		FILM_NAME, FILM_GROSS_SALES, CERTIFICATION_NAME, datename(weekday, f.FILM_RELEASE_DATE)
	order by 
		[Day of Release] desc
if @sort = 0
	select 
		FILM_NAME as [Film Name], 
		'$' + Format(FILM_GROSS_SALES, '#,0') as [Film Gross Sales], 
		c.CERTIFICATION_NAME,
		datename(weekday, f.FILM_RELEASE_DATE) as [Day of Release]
	from 
		FILM f
	inner join 
		CERTIFICATION c
	on 
		f.CERTIFICATION_ID = c.CERTIFICATION_ID
	where
		datepart(dw, f.FILM_RELEASE_DATE) = @day
	group by 
		FILM_NAME, FILM_GROSS_SALES, CERTIFICATION_NAME, datename(weekday, f.FILM_RELEASE_DATE)
	order by 
		FILM_GROSS_SALES desc
else if @sort = 1
	select 
		FILM_NAME as [Film Name], 
		'$' + Format(FILM_GROSS_SALES, '#,0') as [Film Gross Sales], 
		c.CERTIFICATION_NAME,
		datename(weekday, f.FILM_RELEASE_DATE) as [Day of Release]
	from 
		FILM f
	inner join 
		CERTIFICATION c
	on 
		f.CERTIFICATION_ID = c.CERTIFICATION_ID
	where
		datepart(dw, f.FILM_RELEASE_DATE) = @day
	group by 
		FILM_NAME, FILM_GROSS_SALES, CERTIFICATION_NAME, datename(weekday, f.FILM_RELEASE_DATE)
	order by 
		FILM_GROSS_SALES asc
else
	select 
		FILM_NAME as [Film Name], 
		'$' + Format(FILM_GROSS_SALES, '#,0') as [Film Gross Sales], 
		c.CERTIFICATION_NAME,
		datename(weekday, f.FILM_RELEASE_DATE) as [Day of Release]
	from 
		FILM f
	inner join 
		CERTIFICATION c
	on 
		f.CERTIFICATION_ID = c.CERTIFICATION_ID
	where
		datepart(dw, f.FILM_RELEASE_DATE) = @day
	group by 
		FILM_NAME, FILM_GROSS_SALES, CERTIFICATION_NAME, datename(weekday, f.FILM_RELEASE_DATE)
	order by 
		FILM_GROSS_SALES desc
END
GO
/****** Object:  StoredProcedure [dbo].[MONEYACTORS3]    Script Date: 12/2/2017 11:49:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MONEYACTORS3]
    @startyear int,
    @endyear int,
    @certfication int
AS
BEGIN 
    select a.ACTOR_FIRST_NAME, a.ACTOR_LAST_NAME, sum(f.FILM_GROSS_SALES) as [EARNINGS]
    from film f
    inner join Role r
    on r.FILM_ID = f.FILM_ID
    inner join ACTOR a
    on r.ACTOR_ID = a.ACTOR_ID
    inner join CERTIFICATION c
    on c.CERTIFICATION_ID = f.CERTIFICATION_ID
    where (DATEPART(yyyy, f.FILM_RELEASE_DATE) > @startyear) AND (DATEPART(yyyy, f.FILM_RELEASE_DATE) < @endyear) AND f.CERTIFICATION_ID = @certfication
    group by a.ACTOR_FIRST_NAME, a.ACTOR_LAST_NAME 
    order by sum(f.FILM_GROSS_SALES) desc
END

GO
